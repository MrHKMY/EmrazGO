import 'package:flutter/material.dart';

import 'package:flutter_application_1/widgets/bottomNavBar.dart';
import 'package:flutter_application_1/widgets/scroll_behavior.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:flutter_application_1/screens/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      scrollBehavior: MyCustomScrollBehavior(),
      home: SplashScreen(),
      // home: ProvidedStylesExample(
      //   menuScreenContext: context,
      // ),
      initialRoute: "/",
      routes: {
        '/home': (context) => ProvidedStylesExample(
              menuScreenContext: context,
            ),
        //'/first': (context) => HistoryScreen(),
        //'/second': (context) => ProgressScreen()
      },
    );
  }
}
