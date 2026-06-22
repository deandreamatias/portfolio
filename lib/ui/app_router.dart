import 'package:go_router/go_router.dart';
import 'package:portfolio/ui/views/about_view.dart';
import 'package:portfolio/ui/views/career_view.dart';
import 'package:portfolio/ui/views/contact_view.dart';
import 'package:portfolio/ui/views/home_view.dart';
import 'package:portfolio/ui/views/job_detail_view.dart';
import 'package:portfolio/ui/views/project_detail_view.dart';
import 'package:portfolio/ui/views/projects_view.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: HomeView.route,
  routes: <RouteBase>[
    GoRoute(
      path: HomeView.route,
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: HomeView()),
      routes: <RouteBase>[
        GoRoute(
          path: 'projects',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: ProjectsView()),
          routes: <RouteBase>[
            GoRoute(
              path: ':id',
              pageBuilder: (context, state) => NoTransitionPage(
                child: ProjectDetailView(id: state.pathParameters['id']!),
              ),
            ),
          ],
        ),
        GoRoute(
          path: 'jobs',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: CareerView()),
          routes: <RouteBase>[
            GoRoute(
              path: ':id',
              pageBuilder: (context, state) => NoTransitionPage(
                child: JobDetailView(id: state.pathParameters['id']!),
              ),
            ),
          ],
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
