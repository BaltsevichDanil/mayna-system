import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mayna_system/core/presentation/root_screen.dart';
import 'package:mayna_system/core/presentation/splash_screen.dart';
import 'package:mayna_system/features/temp/presentation/pages/temp_main_page.dart';

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
