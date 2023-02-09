import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_1/screens/screens.dart';

class ConfirmationScreen extends StatelessWidget {
  const ConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(title: Text("Confirmation")),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Card(
              child: Container(
                width: 450,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                padding: EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Name: "),
                    SizedBox(height: 5),
                    Text("IC Number: "),
                    SizedBox(height: 5),
                    Text("Vaccine: "),
                    SizedBox(height: 5),
                    Text("Email: "),
                    SizedBox(height: 5),
                    Text("Phone: "),
                    SizedBox(height: 5),
                    Divider(),
                    Text("Full Address: "),
                    SizedBox(height: 5),
                  ],
                ),
              ),
            ),
            Spacer(),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AdditionalFormScreen()),
                  );
                },
                child: Text("Add More"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PaymentScreen()),
                  );
                },
                child: Text("Proceed To Payment"),
              ),
            ])
          ],
        ),
      ),
    );
  }
}
