import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web/core/presentation/root_screen.dart';
import 'package:flutter_web/core/presentation/splash_screen.dart';
import 'package:flutter_web/features/temp/presentation/pages/temp_page.dart';

class EmptyRouterPage extends AutoRouter {
  const EmptyRouterPage({Key? key}) : super(key: key);
}

@CupertinoAutoRouter(
  replaceInRouteName: 'Page,Route,Screen',
  routes: <AutoRoute>[
    AutoRoute(
      path: '/',
      page: RootScreen,
      children: [
        AutoRoute(
          path: 'splash',
          page: SplashScreen,
          initial: true,
        ),
        CustomRoute(
          path: 'main',
          page: TempMainPage,
          transitionsBuilder: TransitionsBuilders.noTransition,
        )
      ],
    ),
  ],
)
class $AppRouter {}
