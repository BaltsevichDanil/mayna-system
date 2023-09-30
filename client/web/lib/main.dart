import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:mayna_system/navigation/auto_router.gr.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  Paint.enableDithering = true;
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static Future<void> setLocale(BuildContext context, String newLocale) async {
    final _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.changeLanguage(newLocale);
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

final AppRouter appRouter = AppRouter();

class _MyAppState extends State<MyApp> {
  Locale _locale = const Locale('ru', '');

  void changeLanguage(String locale) {
    if (locale == 'en') {
      setState(() {
        _locale = const Locale('en', '');
      });
    } else {
      setState(() {
        _locale = const Locale('ru', '');
      });
    }
  }

  @override
  void initState() {
    KeyboardVisibilityController().onChange.listen(
      (isVisible) {
        if (!isVisible) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final FocusScopeNode f = FocusScope.of(context);
        if (!f.hasPrimaryFocus && f.focusedChild != null) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        routerDelegate: appRouter.delegate(),
        routeInformationParser: appRouter.defaultRouteParser(),
        locale: _locale,
      ),
    );
  }
}
