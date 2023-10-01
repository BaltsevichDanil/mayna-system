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

import '../core/presentation/root_screen.dart' as _i1;
import '../core/presentation/splash_screen.dart' as _i2;
import '../features/temp/presentation/pages/temp_page.dart' as _i3;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    RootScreenRoute.name: (routeData) {
      return _i4.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: _i4.WrappedRoute(child: const _i1.RootScreen()),
      );
    },
    SplashScreenRoute.name: (routeData) {
      return _i4.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const _i2.SplashScreen(),
      );
    },
    TempMainPageRoute.name: (routeData) {
      return _i4.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i3.TempMainPage(),
        transitionsBuilder: _i4.TransitionsBuilders.noTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(
          RootScreenRoute.name,
          path: '/',
          children: [
            _i4.RouteConfig(
              '#redirect',
              path: '',
              parent: RootScreenRoute.name,
              redirectTo: 'splash',
              fullMatch: true,
            ),
            _i4.RouteConfig(
              SplashScreenRoute.name,
              path: 'splash',
              parent: RootScreenRoute.name,
            ),
            _i4.RouteConfig(
              TempMainPageRoute.name,
              path: 'main',
              parent: RootScreenRoute.name,
            ),
          ],
        )
      ];
}

/// generated route for
/// [_i1.RootScreen]
class RootScreenRoute extends _i4.PageRouteInfo<void> {
  const RootScreenRoute({List<_i4.PageRouteInfo>? children})
      : super(
          RootScreenRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'RootScreenRoute';
}

/// generated route for
/// [_i2.SplashScreen]
class SplashScreenRoute extends _i4.PageRouteInfo<void> {
  const SplashScreenRoute()
      : super(
          SplashScreenRoute.name,
          path: 'splash',
        );

  static const String name = 'SplashScreenRoute';
}

/// generated route for
/// [_i3.TempMainPage]
class TempMainPageRoute extends _i4.PageRouteInfo<void> {
  const TempMainPageRoute()
      : super(
          TempMainPageRoute.name,
          path: 'main',
        );

  static const String name = 'TempMainPageRoute';
}
