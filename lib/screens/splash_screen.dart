import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_1/widgets/bottomNavBar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => ProvidedStylesExample(
                menuScreenContext: context,
              ),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Color(0xFF730505), Color(0xFFFB0101)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Image.asset('assets/logo/world_map_logo.png'),
            Image.asset('assets/logo/splash_logo.png'),
          ],
        ),
      ),
    );
  }
}
