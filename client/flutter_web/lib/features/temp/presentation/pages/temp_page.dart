import 'package:flutter/material.dart';
import 'package:flutter_telegram_web_app/flutter_telegram_web_app.dart' as tg;

class TempMainPage extends StatelessWidget {
  const TempMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String username = 'hui';
    if (tg.initDataUnsafe.user != null) {
      username = tg.initDataUnsafe.user!.username;
    }

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text(
            username,
          ),
        ),
      ),
    );
  }
}
