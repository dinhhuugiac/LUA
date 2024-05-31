import 'package:flutter/material.dart';
import 'package:lua_v3/conponents/colors.dart';

class FlashPage extends StatelessWidget {
  const FlashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.backGroundColor,
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/flash.png',
                width: 187.5,
                height: 250,
              ),
              const SizedBox(
                height: 38,
              ),
              Image.asset(
                'assets/images/logo.png',
                width: 175,
                height: 80,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
