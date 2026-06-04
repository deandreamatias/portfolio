# Portfolio – Agent Instructions

Flutter web portfolio for [Matias de Andrea](https://deandreamatias.com). Multi-page Flutter web app using `go_router`, built with Flutter stable (managed via FVM).

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

**Key for agents**: Flutter web app with declarative routes in `lib/ui/app_router.dart`. It does not use an external state-management package; local async state uses `ValueNotifier` classes in `lib/ui/notifiers`, with `StatelessWidget`/composition elsewhere. The project is organized into data, UI, localization, assets, web shell, and tests:

```txt
lib/
  main.dart                     # App entry, WidgetsApp.router, l10n delegates, web semantics
  data/
    constants.dart              # URLs, display constants, URL keys
    file_service.dart           # JSON asset loading for projects/jobs
    navigate_links.dart         # External link launcher helper
    models/                     # json_serializable/equatable data models
  l10n/
    app_en.arb
    app_es.arb
    app_pt.arb
    gen_l10n/                   # Generated AppLocalizations output
  ui/
    app_router.dart             # go_router route tree
    views/                      # Full-screen route views
    widgets/                    # Reusable and feature widgets
      buttons/
      breadcrumb/
      home/
      projects/
      text/                     # Typed text wrappers
    style/                      # App theme, breakpoints, sizes, borders, context extensions
    utils/                      # Platform and accessibility helpers
    notifiers/                  # ValueNotifier-backed loaders/state
assets/
  projects.json                 # Project data
  jobs.json                     # Career/job data
  deandreamatias.json           # Profile/CV data
  images/logos/                 # Logo/image assets
web/                            # Static web shell, SEO files, icons, profile image
test/                           # Widget, navigation, and accessibility tests
```

When modifying or extending: preserve this organization. Add new route views to `lib/ui/views/`, reusable widgets to `lib/ui/widgets/`, style tokens/extensions to `lib/ui/style/`, data loading/model code to `lib/data/`, and static content to `assets/` or `web/` as appropriate. Keep component-specific widgets in their parent's file unless reused across multiple parents.

## Key Conventions

**Responsive design** — use `context.isMedium` (≥768 px) as the primary breakpoint. Full breakpoint set in [lib/ui/style/context_extensions.dart](lib/ui/style/context_extensions.dart) and [lib/ui/style/breakpoints.dart](lib/ui/style/breakpoints.dart).

**Spacing** — use constants from [lib/ui/style/sizes.dart](lib/ui/style/sizes.dart): `Sizes.small` (4), `Sizes.medium` (8), `Sizes.large` (16), `Sizes.extraLarge` (32), `Sizes.extraExtraLarge` (64). Do not hardcode pixel values.

**URLs & constants** — centralize in [lib/data/constants.dart](lib/data/constants.dart) (`Urls`, `UrlKeys`, `Constants`).

**Text widgets** — always use the typed wrappers (`DisplayLargeText`, `TitleLargeText`, `BodyMediumText`, etc.) instead of raw `Text`. They apply `Theme.of(context).textTheme` consistently.

**External links** — use `openLink(Uri)` from [lib/data/navigate_links.dart](lib/data/navigate_links.dart).

**JSON data** — projects and jobs are loaded from `assets/projects.json` and `assets/jobs.json` via [lib/data/file_service.dart](lib/data/file_service.dart). Keep model fields in sync with [lib/data/models](lib/data/models), and regenerate `*.g.dart` files after changing `@JsonSerializable()` models.

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
- Theme is custom app theme data with platform brightness and high-contrast detection in [lib/main.dart](lib/main.dart).
- Font: Geologica (body), Titan One (display). Define and resolve theme typography in [lib/ui/style/app_theme.dart](lib/ui/style/app_theme.dart) and [lib/ui/style/theme.dart](lib/ui/style/theme.dart).
- All text widgets must use typed wrappers (`DisplayLargeText`, `BodyMediumText`, etc.) — never raw `Text`.

## Accessibility

**Agent responsibility**: Every UI change must be accessible by default.

- Wrap semantic headers with `Semantics(header: true, child: …)`.
- Provide `semanticsLabel` on interactive `TextSpan` links.
- `SemanticsBinding.instance.ensureSemantics()` is called in `main()` for web.
- Tests in [test/accessibility_test.dart](test/accessibility_test.dart) cover tap targets, text contrast, and semantic headers — keep them green.
- Before merge: run tests locally and verify semantics with screen reader on target platform.

## Deployment

Firebase Hosting, automated via [.github/workflows/deploy_app.yaml](.github/workflows/deploy_app.yaml).  
Firebase config: [firebase.json](firebase.json).
