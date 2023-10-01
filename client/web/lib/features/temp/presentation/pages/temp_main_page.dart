import 'package:flutter/material.dart';
import 'package:mayna_system/core/services/tele_web_app.dart';

class TempMainPage extends StatelessWidget {
  TempMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TeleWebApp twa = TeleWebApp();
    final String username = twa.initDataUnsafe.user!.username ?? 'hui';

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
