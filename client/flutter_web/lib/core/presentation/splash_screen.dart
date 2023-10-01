import 'package:flutter/material.dart';
import 'package:flutter_web/navigation/custom_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    init();
    // handleIncomingDeepLinks();
    // handleInitialDeepLink();
    super.initState();
  }

  Future<void> init() async {
    Future.delayed(
      const Duration(seconds: 2),
      () async {
        CustomRouter(context).goToMainPage();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Text('Загрузка...'),
        ),
      ),
    );
  }
}
