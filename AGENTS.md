# Portfolio – Agent Instructions

Flutter web portfolio for [Matias de Andrea](https://deandreamatias.com). Single-route app targeting web, built with Flutter stable (managed via FVM).

## Build & Test Commands

```sh
flutter pub get                                          # install deps
flutter analyze                                         # lint/static analysis
dart format . --set-exit-if-changed                     # format check
flutter test                                            # run tests
flutter run --dart-define=BIRTHDAY=2000-01-01           # debug run (web)
flutter build web --dart-define=BIRTHDAY='YYYY-MM-DD'   # production build
```

> `BIRTHDAY` is a required `--dart-define` at build/run time.

FVM is used to pin the Flutter version. Use `fvm flutter …` if `flutter` is not on PATH.

> **See [ARCHITECTURE.md](ARCHITECTURE.md) for general project structure, navigation, localization, and design patterns.**

This document adds operational guidance and tooling details for AI agents working on this project.

## Architecture Overview (Expanded for Agents)

See [ARCHITECTURE.md](ARCHITECTURE.md) for the full architecture and design principles.

**Key for agents**: Single-page Flutter web app with no routing beyond root (`/`). No external state management — rely on `StatelessWidget` and composition. Widget tree is organized by concern:

```txt
lib/
  main.dart               # App entry + WidgetsApp + l10n delegates
  shared/                 # Constants, theme, sizes, context extensions, link utils
  views/                  # Full-screen views
  widgets/                # Reusable components
    text/                 # Typed text wrappers (DisplayLargeText, BodyLargeText, …)
    home/                 # Home-specific sub-widgets
```

When modifying or extending: preserve this organization. Add new views to `views/` and reusable widgets to `widgets/`. Keep component-specific widgets in their parent's file unless reused across multiple parents.

## Key Conventions

**Responsive design** — use `context.isMedium` (≥768 px) as the primary breakpoint. Full breakpoint set in [lib/shared/context_extensions.dart](lib/shared/context_extensions.dart).

**Spacing** — use constants from [lib/shared/sizes.dart](lib/shared/sizes.dart): `Sizes.small` (4), `Sizes.medium` (8), `Sizes.large` (16), `Sizes.extraLarge` (32), `Sizes.extraExtraLarge` (64). Do not hardcode pixel values.

**URLs & constants** — centralize in [lib/shared/constants.dart](lib/shared/constants.dart) (`Urls`, `UrlKeys`, `Constants`).

**Text widgets** — always use the typed wrappers (`DisplayLargeText`, `TitleLargeText`, `BodyMediumText`, etc.) instead of raw `Text`. They apply `Theme.of(context).textTheme` consistently.

**External links** — use `openLink(Uri)` from [lib/shared/navigate_links.dart](lib/shared/navigate_links.dart).

**Private sub-widgets** — name with `_` prefix (e.g. `_ColumnContent`); keep them in the same file as their parent unless reused.

## Localization (l10n)

**See** [ARCHITECTURE.md](ARCHITECTURE.md) for general l10n design.

**Agent guidance**: When adding any user-visible string:

1. Add the key to all three ARB files: `lib/l10n/app_en.arb`, `app_es.arb`, `app_pt.arb`.
2. Use `AppLocalizations.of(context).keyName` to access.
3. After ARB edits, run `flutter gen-l10n` to regenerate `lib/l10n/gen_l10n/app_localizations.dart`.
4. Do not hardcode strings in widgets. Every user-facing text must be localized.

## Theming & Responsive Design

See [ARCHITECTURE.md](ARCHITECTURE.md) for design principles.

**Agent guidance**:

- Use `context.isMedium` (≥768 px) as primary breakpoint for responsive layout.
- Theme is Material Design 3 with platform brightness detection (light/dark modes).
- Font: Geologica (body) via GoogleFonts, Titan One (display). Define in [lib/shared/theme.dart](lib/shared/theme.dart).
- All text widgets must use typed wrappers (`DisplayLargeText`, `BodyMediumText`, etc.) — never raw `Text`.

## Accessibility

**Agent responsibility**: Every UI change must be accessible by default.

- Wrap semantic headers with `Semantics(header: true, child: …)`.
- Provide `semanticsLabel` on interactive `TextSpan` links.
- `SemanticsBinding.instance.ensureSemantics()` is called in `main()` for web.
- Tests in [test/accessibility_test.dart](test/accessibility_test.dart) cover tap targets, text contrast, and semantic headers — keep them green.
- Before merge: run tests locally and verify semantics with screen reader on target platform.

See [cross-project mobile accessibility guidelines](mobile-accessibility.instructions.md) for WCAG 2.2 AA baseline and audit checklists.

## Deployment

Firebase Hosting, automated via [.github/workflows/deploy_app.yaml](.github/workflows/deploy_app.yaml).  
Firebase config: [firebase.json](firebase.json).
