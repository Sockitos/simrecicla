import 'package:auto_route/auto_route.dart';
import 'package:simtech/ui/screens/consumer/bin_selection/bin_selection_screen.dart';
import 'package:simtech/ui/screens/consumer/categories_screen.dart';
import 'package:simtech/ui/screens/consumer/consumer_screen.dart';
import 'package:simtech/ui/screens/landing/landing_screen.dart';
import 'package:simtech/ui/screens/packager/form_screen.dart';
import 'package:simtech/ui/screens/packager/packager_screen.dart';
import 'package:simtech/ui/screens/packager/results_screen.dart';
import 'package:simtech/ui/screens/recycler/grid_screen.dart';
import 'package:simtech/ui/screens/recycler/recycler_screen.dart';

@CustomAutoRouter(
  replaceInRouteName: 'Page,Route,Screen',
  transitionsBuilder: TransitionsBuilders.fadeIn,
  durationInMilliseconds: 250,
  routes: <AutoRoute>[
    AutoRoute<void>(
      path: '/',
      initial: true,
      page: LandingScreen,
    ),
    AutoRoute<void>(
      path: '/consumer',
      page: ConsumerScreen,
    ),
    AutoRoute<void>(
      path: '/consumer/categories',
      page: CategoriesScreen,
    ),
    AutoRoute<void>(
      path: '/consumer/bin_selection?package=:package',
      page: BinSelectionScreen,
    ),
    AutoRoute<void>(
      path: '/packager',
      page: PackagerScreen,
    ),
    AutoRoute<void>(
      path: '/packager/form',
      page: FormScreen,
    ),
    AutoRoute<void>(
      path: '/packager/results',
      page: ResultsScreen,
    ),
    AutoRoute<void>(
      path: '/recycler',
      page: RecyclerScreen,
    ),
    AutoRoute<void>(
      path: '/recycler/grid',
      page: GridScreen,
    ),

    // redirect all other paths
    RedirectRoute(path: '*', redirectTo: '/'),
  ],
)
class $AppRouter {}
