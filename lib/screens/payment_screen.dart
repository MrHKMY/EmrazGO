import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;

class PaymentScreen extends StatefulWidget {
  PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  CardFieldInputDetails? _card;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Payment Screen")),
        body: Container(
            child: Column(
          children: [
            // CardField(
            //   cursorColor: Colors.black,
            //   enablePostalCode: true,
            //   countryCode: 'US',
            //   postalCodeHintText: 'Enter the us postal code',
            //   onCardChanged: (card) {
            //     setState(() {
            //       _card = card;
            //     });
            //   },
            // ),
            ElevatedButton(
              onPressed: () {},
              child: Text("Test Payment"),
            ),
          ],
        )));
  }
}
