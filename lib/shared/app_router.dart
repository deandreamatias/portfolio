import 'package:go_router/go_router.dart';
import 'package:portfolio/views/about_view.dart';
import 'package:portfolio/views/career_view.dart';
import 'package:portfolio/views/contact_view.dart';
import 'package:portfolio/views/home.dart';
import 'package:portfolio/views/project_detail_view.dart';
import 'package:portfolio/views/projects_view.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: HomeView.route,
  routes: <RouteBase>[
    GoRoute(
      path: HomeView.route,
      pageBuilder: (context, state) => const NoTransitionPage(child: HomeView()),
      routes: <RouteBase>[
        GoRoute(
          path: 'projects',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: ProjectsView()),
          routes: <RouteBase>[
            GoRoute(
              path: ':id',
              pageBuilder: (context, state) => NoTransitionPage(
                child: ProjectDetailView(
                  id: state.pathParameters['id']!,
                ),
              ),
            ),
          ],
        ),
        GoRoute(
          path: 'career',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: CareerView()),
        ),
        GoRoute(
          path: 'about',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: AboutView()),
        ),
        GoRoute(
          path: 'contact',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: ContactView()),
        ),
      ],
    ),
  ],
);
