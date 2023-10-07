import 'package:flutter/material.dart';
import 'package:flutter_web/core/services/flutter_telegram_web.dart' as tg;

class TempMainPage extends StatelessWidget {
  const TempMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String username = 'hui';

    if (tg.initDataUnsafe.user != null) {
      print(tg.initDataUnsafe);
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
