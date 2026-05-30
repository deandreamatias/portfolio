---
applyTo: "**/*.dart"
---

# Dart / Flutter file conventions for this project

- Use `StatelessWidget` by default. Only use `StatefulWidget` when local mutable state is truly required.
- Use typed text wrappers (`DisplayLargeText`, `TitleLargeText`, `BodyMediumText`, etc.) — never raw `Text` widgets.
- Use `Sizes.*` constants for all padding/spacing; no hardcoded pixel values.
- Use `context.isMedium` (and sibling extensions) for responsive layout — never raw `MediaQuery.of(context).size` comparisons.
- All user-visible strings must come from `AppLocalizations.of(context).<key>`. Add new keys to all three ARB files (`app_en.arb`, `app_es.arb`, `app_pt.arb`).
- External URLs must be declared in `lib/shared/constants.dart` and opened via `openLink(Uri)`.
- Prefix private sub-widgets with `_`; co-locate them with their parent widget file unless they are reused.
- Keep accessibility in mind: wrap heading widgets in `Semantics(header: true)` and provide `semanticsLabel` on link spans.
