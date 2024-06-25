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
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;
import 'package:flutter_task/application/presentation/features/main/features/process/page/process_page.dart'
    as _i3;
import 'package:flutter_task/application/presentation/features/main/page/main_page.dart'
    as _i2;
import 'package:flutter_task/application/presentation/initial_page.dart' as _i1;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    InitialRoute.name: (routeData) {
      return _i4.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.InitialPage(),
      );
    },
    MainRoute.name: (routeData) {
      final args =
          routeData.argsAs<MainRouteArgs>(orElse: () => const MainRouteArgs());
      return _i4.CustomPage<dynamic>(
        routeData: routeData,
        child: _i4.WrappedRoute(
            child: _i2.MainPage(
          key: args.key,
          initialTabIndex: args.initialTabIndex,
        )),
        transitionsBuilder: _i4.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ProcessRoute.name: (routeData) {
      final args = routeData.argsAs<ProcessRouteArgs>();
      return _i4.CustomPage<dynamic>(
        routeData: routeData,
        child: _i3.ProcessPage(
          baseUrl: args.baseUrl,
          key: args.key,
        ),
        transitionsBuilder: _i4.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(
          InitialRoute.name,
          path: '/',
          children: [
            _i4.RouteConfig(
              MainRoute.name,
              path: 'main_page',
              parent: InitialRoute.name,
            ),
            _i4.RouteConfig(
              ProcessRoute.name,
              path: 'process_page',
              parent: InitialRoute.name,
            ),
          ],
        ),
        _i4.RouteConfig(
          '*#redirect',
          path: '*',
          redirectTo: '/',
          fullMatch: true,
        ),
      ];
}

/// generated route for
/// [_i1.InitialPage]
class InitialRoute extends _i4.PageRouteInfo<void> {
  const InitialRoute({List<_i4.PageRouteInfo>? children})
      : super(
          InitialRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'InitialRoute';
}

/// generated route for
/// [_i2.MainPage]
class MainRoute extends _i4.PageRouteInfo<MainRouteArgs> {
  MainRoute({
    _i5.Key? key,
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

  final _i5.Key? key;

  final int initialTabIndex;

  @override
  String toString() {
    return 'MainRouteArgs{key: $key, initialTabIndex: $initialTabIndex}';
  }
}

/// generated route for
/// [_i3.ProcessPage]
class ProcessRoute extends _i4.PageRouteInfo<ProcessRouteArgs> {
  ProcessRoute({
    required String baseUrl,
    _i5.Key? key,
  }) : super(
          ProcessRoute.name,
          path: 'process_page',
          args: ProcessRouteArgs(
            baseUrl: baseUrl,
            key: key,
          ),
        );

  static const String name = 'ProcessRoute';
}

class ProcessRouteArgs {
  const ProcessRouteArgs({
    required this.baseUrl,
    this.key,
  });

  final String baseUrl;

  final _i5.Key? key;

  @override
  String toString() {
    return 'ProcessRouteArgs{baseUrl: $baseUrl, key: $key}';
  }
}
