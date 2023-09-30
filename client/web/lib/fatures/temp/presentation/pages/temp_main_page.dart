import 'package:flutter/material.dart';

class TempMainPage extends StatelessWidget {
  const TempMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Text(
            'TempMainPage',
          ),
        ),
      ),
    );
  }
}
