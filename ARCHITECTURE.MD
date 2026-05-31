# Architecture

## Navigation

Using [go_router](https://pub.dev/packages/go_router). Schema:

```txt
/ -> HomePage
-- /projects -> ProjectsPage
---- /projects/:id -> ProjectDetailPage
-- /career -> CareerPage
-- /about -> AboutPage
-- /contact -> ContactPage
```

## Localization

Using [flutter_localizations](https://api.flutter.dev/flutter/flutter_localizations/flutter_localizations-library.html) and [intl](https://pub.dev/packages/intl) packages. Automatic localization is supported. The localization files are located in `lib/l10n` folder. The app supports:

- **English** - `en`
- **Spanish** - `es`
- **Portuguese** - `pt`

## Design

- Responsive design with breakpoints.
- Atomic design principles: reusable widgets, separation of concerns.
- Dark and light themes with high contrast and accessibility in mind.
- Consistent typography using Google Fonts.
