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
