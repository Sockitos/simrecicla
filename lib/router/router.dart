import 'package:collection/collection.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:simrecicla/data/consumer_data.dart';
import 'package:simrecicla/services/packager_service.dart';
import 'package:simrecicla/ui/screens/consumer/bin_selection/bin_selection_screen.dart';
import 'package:simrecicla/ui/screens/consumer/categories/categories_screen.dart';
import 'package:simrecicla/ui/screens/consumer/consumer_screen.dart';
import 'package:simrecicla/ui/screens/error/error_screen.dart';
import 'package:simrecicla/ui/screens/landing/landing_screen.dart';
import 'package:simrecicla/ui/screens/packager/form/form_screen.dart';
import 'package:simrecicla/ui/screens/packager/form/form_screen_model.dart';
import 'package:simrecicla/ui/screens/packager/packager_screen.dart';
import 'package:simrecicla/ui/screens/packager/results/results_screen.dart';
import 'package:simrecicla/ui/screens/recycler/grid/grid_screen.dart';
import 'package:simrecicla/ui/screens/recycler/recycler_screen.dart';

CustomTransitionPage<T> pageBuilder<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionDuration: const Duration(milliseconds: 250),
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        FadeTransition(opacity: animation, child: child),
  );
}

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        pageBuilder: (context, state) => pageBuilder<void>(
          context: context,
          state: state,
          child: const LandingScreen(),
        ),
        routes: [
          GoRoute(
            path: 'consumer',
            pageBuilder: (context, state) => pageBuilder<void>(
              context: context,
              state: state,
              child: const ConsumerScreen(),
            ),
            routes: [
              GoRoute(
                path: 'categories',
                pageBuilder: (context, state) => pageBuilder<void>(
                  context: context,
                  state: state,
                  child: const CategoriesScreen(),
                ),
              ),
              GoRoute(
                path: 'bin_selection',
                pageBuilder: (context, state) {
                  final packageId =
                      int.parse(state.queryParameters['package']!);
                  const categories = ConsumerData.categories;
                  final packages = [for (final c in categories) ...c.packages];
                  final package = packages.firstWhere((c) => c.id == packageId);
                  return pageBuilder<void>(
                    context: context,
                    state: state,
                    child: ProviderScope(
                      overrides: [packageProvider.overrideWithValue(package)],
                      child: const BinSelectionScreen(),
                    ),
                  );
                },
                redirect: (context, state) {
                  final rawPackageId = state.queryParameters['package'];
                  if (rawPackageId == null) return '/consumer/categories';
                  final packageId = int.tryParse(rawPackageId);
                  if (packageId == null) return '/consumer/categories';
                  const categories = ConsumerData.categories;
                  final packages = [for (final c in categories) ...c.packages];
                  final package =
                      packages.firstWhereOrNull((c) => c.id == packageId);
                  if (package == null) return '/consumer/categories';
                  return null;
                },
              ),
            ],
          ),
          GoRoute(
            path: 'packager',
            pageBuilder: (context, state) => pageBuilder<void>(
              context: context,
              state: state,
              child: const PackagerScreen(),
            ),
            routes: [
              GoRoute(
                path: 'form',
                pageBuilder: (context, state) => pageBuilder<void>(
                  context: context,
                  state: state,
                  child: const FormScreen(),
                ),
                routes: [
                  GoRoute(
                    path: 'results',
                    pageBuilder: (context, state) {
                      final formState = ref.read(formScreenSNProvider);
                      return pageBuilder<void>(
                        context: context,
                        state: state,
                        child: ResultsScreen(
                          rating: formState.rating,
                          recommendations: formState.recommendations,
                          impact: PackagerService.calculateImpact(
                            material: formState.material!,
                            weight: formState.weight!,
                            recycledPercentage: formState.recycledPercentage,
                            rating: formState.rating,
                          ),
                        ),
                      );
                    },
                    redirect: (context, state) {
                      final formState = ref.read(formScreenSNProvider);
                      if (!formState.isSubmittable) return '/packager/form';
                      return null;
                    },
                  ),
                ],
              ),
            ],
          ),
          GoRoute(
            path: 'recycler',
            pageBuilder: (context, state) => pageBuilder<void>(
              context: context,
              state: state,
              child: const RecyclerScreen(),
            ),
            routes: [
              GoRoute(
                path: 'grid',
                pageBuilder: (context, state) {
                  final type = GridType.values.firstWhere(
                    (t) => t.name == state.queryParameters['type'],
                  );
                  return pageBuilder<void>(
                    context: context,
                    state: state,
                    child: ProviderScope(
                      overrides: [typeProvider.overrideWithValue(type)],
                      child: const GridScreen(),
                    ),
                  );
                },
                redirect: (context, state) {
                  if (state.queryParameters.containsKey('type')) {
                    final type = GridType.values.firstWhereOrNull(
                      (t) => t.name == state.queryParameters['type'],
                    );
                    return type == null ? '/recycler' : null;
                  } else {
                    return '/recycler';
                  }
                },
              ),
            ],
          ),
        ],
      ),
    ],
    errorPageBuilder: (context, state) => pageBuilder<void>(
      context: context,
      state: state,
      child: const ErrorScreen(),
    ),
  );
});
