import 'package:flutter/material.dart';
import 'package:portfolio/ui/style/context_extensions.dart';
import 'package:portfolio/ui/style/sizes.dart';
import 'package:portfolio/ui/widgets/text/title_large_text.dart';

class BreadcrumbSegment {
  const BreadcrumbSegment({
    required this.label,
    this.onPressed,
    this.semanticsLabel,
  });

  final String label;
  final VoidCallback? onPressed;
  final String? semanticsLabel;
}

class Breadcrumb extends StatelessWidget {
  const Breadcrumb({
    super.key,
    required this.segments,
    this.separator = '›',
    this.color,
  }) : assert(segments.length > 0, 'segments must not be empty');

  final List<BreadcrumbSegment> segments;
  final String separator;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final Color textColor = color ?? context.appColors.onSurface;

    return Semantics(
      header: true,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          for (int i = 0; i < segments.length; i++) ...<Widget>[
            if (i > 0)
              _BreadcrumbSeparator(separator: separator, color: textColor),
            _BreadcrumbSegmentWidget(segment: segments[i], color: textColor),
          ],
        ],
      ),
    );
  }
}

class _BreadcrumbSeparator extends StatelessWidget {
  const _BreadcrumbSeparator({required this.separator, required this.color});

  final String separator;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Sizes.extraSmall),
      child: TitleLargeText(separator, color: color),
    );
  }
}

class _BreadcrumbSegmentWidget extends StatelessWidget {
  const _BreadcrumbSegmentWidget({required this.segment, required this.color});

  final BreadcrumbSegment segment;
  final Color color;

  @override
  Widget build(BuildContext context) {
    if (segment.onPressed != null) {
      return _BreadcrumbLink(segment: segment, color: color);
    }
    return TitleLargeText(segment.label, color: color);
  }
}

class _BreadcrumbLink extends StatefulWidget {
  const _BreadcrumbLink({required this.segment, required this.color});

  final BreadcrumbSegment segment;
  final Color color;

  @override
  State<_BreadcrumbLink> createState() => _BreadcrumbLinkState();
}

class _BreadcrumbLinkState extends State<_BreadcrumbLink> {
  bool _hovered = false;
  bool _focused = false;

  bool get _showUnderline => _hovered || _focused;

  TextStyle _style(BuildContext context) {
    return context.appTextStyles.titleLarge.copyWith(
      color: widget.color,
      decoration: _showUnderline
          ? TextDecoration.underline
          : TextDecoration.none,
      decorationColor: widget.color,
    );
  }

  @override
  Widget build(BuildContext context) {
    final String semanticsLabel =
        widget.segment.semanticsLabel ?? widget.segment.label;

    return Semantics(
      button: true,
      label: semanticsLabel,
      onTap: widget.segment.onPressed,
      child: FocusableActionDetector(
        mouseCursor: SystemMouseCursors.click,
        onShowFocusHighlight: (_) => false,
        onShowHoverHighlight: (_) => false,
        actions: <Type, Action<Intent>>{
          ActivateIntent: CallbackAction<ActivateIntent>(
            onInvoke: (_) {
              widget.segment.onPressed?.call();
              return null;
            },
          ),
        },
        onFocusChange: (bool focused) {
          setState(() => _focused = focused);
        },
        child: MouseRegion(
          onEnter: (_) => setState(() => _hovered = true),
          onExit: (_) => setState(() => _hovered = false),
          child: GestureDetector(
            onTap: widget.segment.onPressed,
            behavior: HitTestBehavior.opaque,
            child: Text(widget.segment.label, style: _style(context)),
          ),
        ),
      ),
    );
  }
}
