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

## Architecture

Single-page Flutter web app. No routing beyond the root `/` route. No state management library — widgets are mostly `StatelessWidget`.

```txt
lib/
  main.dart               # App entry, MaterialApp + l10n delegates
  shared/                 # Constants, theme, sizes, context extensions, link utils
  views/                  # Full-screen views
  widgets/                # Reusable widgets
    text/                 # Typed text wrappers (DisplayLargeText, BodyLargeText, …)
    home/                 # Home-specific sub-widgets
```

See [CONTRIBUTING.md](CONTRIBUTING.md) for contribution workflow.

## Key Conventions

**Responsive design** — use `context.isMedium` (≥768 px) as the primary breakpoint. Full breakpoint set in [lib/shared/context_extensions.dart](lib/shared/context_extensions.dart).

**Spacing** — use constants from [lib/shared/sizes.dart](lib/shared/sizes.dart): `Sizes.small` (4), `Sizes.medium` (8), `Sizes.large` (16), `Sizes.extraLarge` (32), `Sizes.extraExtraLarge` (64). Do not hardcode pixel values.

**URLs & constants** — centralize in [lib/shared/constants.dart](lib/shared/constants.dart) (`Urls`, `UrlKeys`, `Constants`).

**Text widgets** — always use the typed wrappers (`DisplayLargeText`, `TitleLargeText`, `BodyMediumText`, etc.) instead of raw `Text`. They apply `Theme.of(context).textTheme` consistently.

**External links** — use `openLink(Uri)` from [lib/shared/navigate_links.dart](lib/shared/navigate_links.dart).

**Private sub-widgets** — name with `_` prefix (e.g. `_ColumnContent`); keep them in the same file as their parent unless reused.

## Localization (l10n)

ARB files: [lib/l10n/app_en.arb](lib/l10n/app_en.arb), `app_es.arb`, `app_pt.arb` — English, Spanish, Portuguese.  
Generated API: `AppLocalizations.of(context).<key>`.  
Config: [l10n.yaml](l10n.yaml). Run `flutter gen-l10n` (or `flutter pub get`) to regenerate after editing ARB files.  
All user-visible strings must be localized in all three ARB files.

## Theming

Material Design 3. Light/dark mode via platform brightness. Font: Geologica (body) + Titan One (display) via GoogleFonts.  
Theme definition: [lib/shared/theme.dart](lib/shared/theme.dart).

## Accessibility

- Wrap semantic headers with `Semantics(header: true, child: …)`.
- Provide `semanticsLabel` on interactive `TextSpan` links.
- `SemanticsBinding.instance.ensureSemantics()` is called in `main()` for web.
- Tests in [test/accessibility_test.dart](test/accessibility_test.dart) cover tap targets, text contrast, and semantic headers — keep them green.

## Deployment

Firebase Hosting, automated via [.github/workflows/deploy_app.yaml](.github/workflows/deploy_app.yaml).  
Firebase config: [firebase.json](firebase.json).
