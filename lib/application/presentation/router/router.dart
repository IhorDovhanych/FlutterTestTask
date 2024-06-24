import 'package:auto_route/auto_route.dart';
import 'package:proj_base/application/presentation/features/main/page/main_page.dart';
import 'package:proj_base/application/presentation/initial_page.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page|Screen|BottomSheet,Route',
  routes: [
    AutoRoute(
      path: '/',
      page: InitialPage,
      children: [
        CustomRoute(
          path: 'main_page',
          page: MainPage,
          transitionsBuilder: TransitionsBuilders.fadeIn,
        ),
      ],
    ),
    RedirectRoute(
      path: '*',
      redirectTo: '/',
    ),
  ],
)
class $AppRouter {}