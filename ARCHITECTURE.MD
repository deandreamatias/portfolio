# Architecture

Flutter web portfolio for Matias de Andrea. The app is a small routed web experience built with `WidgetsApp.router`, `go_router`, generated Flutter localization, JSON asset-backed content, and a custom design system under `lib/ui/style`.

## Project Structure

```txt
lib/
  main.dart                     # App entry, WidgetsApp.router, l10n delegates, web semantics
  data/
    constants.dart              # External URLs and display constants
    file_service.dart           # Loads JSON assets from rootBundle
    navigate_links.dart         # URL launcher helper for external links
    models/
      job.dart                  # Job, deliverables, and link data models
      project.dart              # Project data model
      showcase.dart             # Combined project/job showcase model
      *.g.dart                  # json_serializable generated code
  l10n/
    app_en.arb                  # English strings
    app_es.arb                  # Spanish strings
    app_pt.arb                  # Portuguese strings
    gen_l10n/                   # Generated AppLocalizations files
  ui/
    app_router.dart             # go_router route configuration
    views/                      # Route-level screens
    widgets/                    # Reusable UI and feature widgets
      buttons/
      breadcrumb/
      home/
      projects/
      text/                     # Typed text widgets
    style/                      # Theme, breakpoints, sizes, borders, context extensions
    utils/                      # Platform and accessibility helpers
    notifiers/                  # ValueNotifier-backed async UI state
assets/
  projects.json                 # Project content
  jobs.json                     # Career content
  deandreamatias.json           # Profile/CV content
  images/logos/                 # Logos and project/company images
web/
  index.html                    # Flutter web shell
  style.css                     # Initial web document styles
  manifest.json                 # PWA manifest
  robots.txt, sitemap.xml       # SEO files
  404.html                      # Static hosting fallback page
  icons/                        # Favicons and platform icons
test/
  accessibility_test.dart
  home_navigation_test.dart
```

## App Shell

[lib/main.dart](lib/main.dart) configures path-based URLs with `usePathUrlStrategy()`, starts `WidgetsApp.router`, wires generated `AppLocalizations`, and enables semantics on web. It reads platform brightness and high-contrast settings, resolves typography from the current viewport, and exposes the custom `AppTheme` to the widget tree.

## Navigation

Navigation is declared in [lib/ui/app_router.dart](lib/ui/app_router.dart) with `go_router`. Routes use `NoTransitionPage`.

```txt
/                         -> HomeView
/projects                 -> ProjectsView
/projects/:id             -> ProjectDetailView
/jobs                     -> CareerView
/jobs/:jobId              -> ProjectDetailView
/jobs/:jobId/project/:id  -> ProjectDetailView
/about                    -> AboutView
/contact                  -> ContactView
```

Route-level screens live in `lib/ui/views`. Shared route chrome and reusable UI live in `lib/ui/widgets`.

## Data Flow

Content is stored as JSON under `assets/` and loaded by [lib/data/file_service.dart](lib/data/file_service.dart) through `rootBundle`.

- `assets/projects.json` maps to `Project`. Projects with a `job_id` belong to a job and display the job's `enterprise` name.
- `assets/jobs.json` maps to `Job`. Jobs reference their projects via `deliverables` array of `JobDeliverableRef` (each with a `project_id`).
- `ShowcaseNotifier` loads all projects, sorts by start date.
- `JobDetailView` loads a job by ID and filters related projects by `job_id`.
- `ProjectDetailView` loads a project and, if it has a `job_id`, loads the related job for breadcrumb navigation.

Models use `json_annotation`, `json_serializable`, and `equatable`. When a serializable model changes, regenerate the matching `*.g.dart` files with `build_runner`.

## Localization

Localization uses Flutter's generated l10n support with `flutter_localizations` and `intl`.

Supported locales:

- English: `en`
- Spanish: `es`
- Portuguese: `pt`

ARB files live in `lib/l10n`. Generated files live in `lib/l10n/gen_l10n` and are imported as `package:portfolio/l10n/gen_l10n/app_localizations.dart`. User-visible strings should come from `AppLocalizations.of(context)`.

## UI System

The UI layer is grouped under `lib/ui`.

- `style/app_theme.dart` and `style/theme.dart` define the custom theme, colors, typography, and brightness/high-contrast variants.
- `style/breakpoints.dart` defines responsive thresholds.
- `style/context_extensions.dart` exposes viewport helpers such as `context.isMedium` and theme helpers such as `context.appColors`.
- `style/sizes.dart` centralizes spacing constants.
- `widgets/text/` contains typed text wrappers and should be preferred over raw `Text`.
- `widgets/buttons/`, `widgets/breadcrumb/`, `widgets/home/`, and `widgets/projects/` contain reusable or feature-specific UI components.

The primary responsive breakpoint is `context.isMedium` (`>= 768`). Typography also adapts through `context.typographyVariant`.

## Accessibility

Web semantics are enabled in `main()`. UI changes should preserve semantic headers, accessible link labels, keyboard/focus behavior, adequate tap targets, and text contrast. Accessibility coverage lives in [test/accessibility_test.dart](test/accessibility_test.dart).

## Web And Deployment

Static web files live in `web/`, including icons, SEO files, manifest, profile image, and the Firebase Hosting fallback page. Deployment is configured for Firebase Hosting in [firebase.json](firebase.json) and automated by `.github/workflows/deploy_app.yaml`.
