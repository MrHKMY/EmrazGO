import 'package:flutter/material.dart';

import 'package:flutter_application_1/widgets/bottomNavBar.dart';
import 'package:flutter_application_1/widgets/scroll_behavior.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:flutter_application_1/screens/screens.dart';

void main() {
  // Stripe.publishableKey =
  //     "pk_test_51MY3SQEas2niiHpBDcwsS1NUZ3SBQBxkvCxAJPo1dT4ACGHld0HZt2b37QqS2K7uljYGu4gHFf0b3dY26FL6Lj4100FsiYEkTC";

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
      home: LoginScreen(),
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
