import 'package:flutter/material.dart';
import 'package:portfolio/ui/style/sizes.dart';

class FocusBorder extends StatefulWidget {
  final Widget child;
  final bool skipTraversal;
  final Color focusedColor;
  final double borderRadiusCircle;
  final double width;
  final VoidCallback? onPressed;
  final bool enabled;

  const FocusBorder({
    super.key,
    required this.child,
    this.skipTraversal = true,
    this.borderRadiusCircle = Sizes.small,
    required this.focusedColor,
    this.width = 1.5,
    this.onPressed,
    this.enabled = true,
  });

  @override
  State<FocusBorder> createState() => _FocusBorderState();
}

class _FocusBorderState extends State<FocusBorder> {
  final ValueNotifier<bool> isFocused = ValueNotifier(false);
  Color get focusColor => widget.focusedColor;

  @override
  void didUpdateWidget(covariant FocusBorder oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!widget.enabled && oldWidget.enabled) isFocused.value = false;
  }

  @override
  Widget build(BuildContext context) {
    return FocusableActionDetector(
      enabled: widget.enabled,
      descendantsAreFocusable: widget.enabled,
      mouseCursor: widget.enabled
          ? SystemMouseCursors.click
          : SystemMouseCursors.basic,
      includeFocusSemantics: false,
      actions: {
        ActivateIntent: CallbackAction<ActivateIntent>(
          onInvoke: (intent) => widget.onPressed?.call(),
        ),
      },
      descendantsAreTraversable: !widget.skipTraversal && widget.enabled,
      onFocusChange: (value) {
        if (widget.enabled) isFocused.value = value;
      },
      child: ValueListenableBuilder(
        valueListenable: isFocused,
        child: widget.child,
        builder: (context, value, child) => DecoratedBox(
          position: DecorationPosition.foreground,
          decoration: BoxDecoration(
            border: Border.all(
              color: isFocused.value && widget.enabled
                  ? focusColor
                  : Colors.transparent,
              width: widget.width,
            ),
            borderRadius: BorderRadius.circular(widget.borderRadiusCircle),
          ),
          child: child,
        ),
      ),
    );
  }
}
