// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;
import 'package:flutter_task/application/domain/entities/grid_entity.dart'
    as _i8;
import 'package:flutter_task/application/presentation/features/main/features/grid/page/grid_detail_page.dart'
    as _i5;
import 'package:flutter_task/application/presentation/features/main/features/grid/page/grid_list_page.dart'
    as _i4;
import 'package:flutter_task/application/presentation/features/main/features/process/page/process_page.dart'
    as _i3;
import 'package:flutter_task/application/presentation/features/main/page/main_page.dart'
    as _i2;
import 'package:flutter_task/application/presentation/initial_page.dart' as _i1;

class AppRouter extends _i6.RootStackRouter {
  AppRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    InitialRoute.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.InitialPage(),
      );
    },
    MainRoute.name: (routeData) {
      final args =
          routeData.argsAs<MainRouteArgs>(orElse: () => const MainRouteArgs());
      return _i6.CustomPage<dynamic>(
        routeData: routeData,
        child: _i6.WrappedRoute(
            child: _i2.MainPage(
          key: args.key,
          initialTabIndex: args.initialTabIndex,
        )),
        transitionsBuilder: _i6.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ProcessRoute.name: (routeData) {
      final args = routeData.argsAs<ProcessRouteArgs>();
      return _i6.CustomPage<dynamic>(
        routeData: routeData,
        child: _i3.ProcessPage(
          key: args.key,
          baseUrl: args.baseUrl,
        ),
        transitionsBuilder: _i6.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    GridListRoute.name: (routeData) {
      final args = routeData.argsAs<GridListRouteArgs>();
      return _i6.CustomPage<dynamic>(
        routeData: routeData,
        child: _i4.GridListPage(
          key: args.key,
          gridList: args.gridList,
        ),
        transitionsBuilder: _i6.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    GridDetailRoute.name: (routeData) {
      final args = routeData.argsAs<GridDetailRouteArgs>();
      return _i6.CustomPage<dynamic>(
        routeData: routeData,
        child: _i5.GridDetailPage(
          key: args.key,
          grid: args.grid,
        ),
        transitionsBuilder: _i6.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(
          InitialRoute.name,
          path: '/',
          children: [
            _i6.RouteConfig(
              MainRoute.name,
              path: 'main_page',
              parent: InitialRoute.name,
            ),
            _i6.RouteConfig(
              ProcessRoute.name,
              path: 'process_page',
              parent: InitialRoute.name,
            ),
            _i6.RouteConfig(
              GridListRoute.name,
              path: 'grid_list_page',
              parent: InitialRoute.name,
            ),
            _i6.RouteConfig(
              GridDetailRoute.name,
              path: 'grid_detail_page',
              parent: InitialRoute.name,
            ),
          ],
        ),
        _i6.RouteConfig(
          '*#redirect',
          path: '*',
          redirectTo: '/',
          fullMatch: true,
        ),
      ];
}

/// generated route for
/// [_i1.InitialPage]
class InitialRoute extends _i6.PageRouteInfo<void> {
  const InitialRoute({List<_i6.PageRouteInfo>? children})
      : super(
          InitialRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'InitialRoute';
}

/// generated route for
/// [_i2.MainPage]
class MainRoute extends _i6.PageRouteInfo<MainRouteArgs> {
  MainRoute({
    _i7.Key? key,
    int initialTabIndex = 0,
  }) : super(
          MainRoute.name,
          path: 'main_page',
          args: MainRouteArgs(
            key: key,
            initialTabIndex: initialTabIndex,
          ),
        );

  static const String name = 'MainRoute';
}

class MainRouteArgs {
  const MainRouteArgs({
    this.key,
    this.initialTabIndex = 0,
  });

  final _i7.Key? key;

  final int initialTabIndex;

  @override
  String toString() {
    return 'MainRouteArgs{key: $key, initialTabIndex: $initialTabIndex}';
  }
}

/// generated route for
/// [_i3.ProcessPage]
class ProcessRoute extends _i6.PageRouteInfo<ProcessRouteArgs> {
  ProcessRoute({
    _i7.Key? key,
    required String baseUrl,
  }) : super(
          ProcessRoute.name,
          path: 'process_page',
          args: ProcessRouteArgs(
            key: key,
            baseUrl: baseUrl,
          ),
        );

  static const String name = 'ProcessRoute';
}

class ProcessRouteArgs {
  const ProcessRouteArgs({
    this.key,
    required this.baseUrl,
  });

  final _i7.Key? key;

  final String baseUrl;

  @override
  String toString() {
    return 'ProcessRouteArgs{key: $key, baseUrl: $baseUrl}';
  }
}

/// generated route for
/// [_i4.GridListPage]
class GridListRoute extends _i6.PageRouteInfo<GridListRouteArgs> {
  GridListRoute({
    _i7.Key? key,
    required List<_i8.GridEntity> gridList,
  }) : super(
          GridListRoute.name,
          path: 'grid_list_page',
          args: GridListRouteArgs(
            key: key,
            gridList: gridList,
          ),
        );

  static const String name = 'GridListRoute';
}

class GridListRouteArgs {
  const GridListRouteArgs({
    this.key,
    required this.gridList,
  });

  final _i7.Key? key;

  final List<_i8.GridEntity> gridList;

  @override
  String toString() {
    return 'GridListRouteArgs{key: $key, gridList: $gridList}';
  }
}

/// generated route for
/// [_i5.GridDetailPage]
class GridDetailRoute extends _i6.PageRouteInfo<GridDetailRouteArgs> {
  GridDetailRoute({
    _i7.Key? key,
    required _i8.GridEntity grid,
  }) : super(
          GridDetailRoute.name,
          path: 'grid_detail_page',
          args: GridDetailRouteArgs(
            key: key,
            grid: grid,
          ),
        );

  static const String name = 'GridDetailRoute';
}

class GridDetailRouteArgs {
  const GridDetailRouteArgs({
    this.key,
    required this.grid,
  });

  final _i7.Key? key;

  final _i8.GridEntity grid;

  @override
  String toString() {
    return 'GridDetailRouteArgs{key: $key, grid: $grid}';
  }
}
