import 'package:auto_route/auto_route.dart';
import 'package:flutter_task/application/presentation/features/main/features/grid/page/grid_detail_page.dart';
import 'package:flutter_task/application/presentation/features/main/features/grid/page/grid_list_page.dart';
import 'package:flutter_task/application/presentation/features/main/features/process/page/process_page.dart';
import 'package:flutter_task/application/presentation/features/main/page/main_page.dart';
import 'package:flutter_task/application/presentation/initial_page.dart';

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
        CustomRoute(
          path: 'process_page',
          page: ProcessPage,
          transitionsBuilder: TransitionsBuilders.fadeIn,
        ),
        CustomRoute(
          path: 'grid_list_page',
          page: GridListPage,
          transitionsBuilder: TransitionsBuilders.fadeIn,
        ),CustomRoute(
          path: 'grid_detail_page',
          page: GridDetailPage,
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
