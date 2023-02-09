import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_1/screens/screens.dart';

import '../screens/screens.dart';

class CardWidget extends StatelessWidget {
  CardWidget({super.key, required this.text});

  String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => BookingScreen()));
        Navigator.of(context, rootNavigator: true)
            .push(MaterialPageRoute(builder: (context) => BookingStepper()));
      },
      child: Card(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 100,
            width: 150,
            decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(5))),
          ),
          SizedBox(height: 8),
          Text(text),
        ],
      )),
    );
  }
}
