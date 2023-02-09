import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_1/screens/screens.dart';

import 'package:flutter_application_1/widgets/bottomNavBar.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final emailController = TextEditingController();
  final passController = TextEditingController();
  final passConfirmationController = TextEditingController();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();

  final _addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register New User"),
      ),
      body: Center(
        child: Container(
            padding: const EdgeInsets.all(8),
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: emailController,
                  cursorColor: Colors.black,
                  style: const TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(8)),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: passController,
                  cursorColor: Colors.black,
                  obscureText: true,
                  style: const TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: "Create Password",
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(8)),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: passConfirmationController,
                  cursorColor: Colors.black,
                  obscureText: true,
                  style: const TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: "Confirm Password",
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(8)),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _nameController,
                  cursorColor: Colors.black,
                  style: const TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    labelText: "Full Name",
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(8)),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                // TextFormField(
                //   controller: _phoneController,
                //   keyboardType: TextInputType.number,
                //   cursorColor: Colors.black,
                //   style: const TextStyle(color: Colors.black),
                //   decoration: InputDecoration(
                //     labelText: "Phone Number",
                //     border: OutlineInputBorder(
                //         borderSide: const BorderSide(color: Colors.black),
                //         borderRadius: BorderRadius.circular(8)),
                //   ),
                // ),
                // const SizedBox(
                //   height: 10,
                // ),
                // TextFormField(
                //   controller: _addressController,
                //   cursorColor: Colors.black,
                //   style: const TextStyle(color: Colors.black),
                //   decoration: InputDecoration(
                //     labelText: "Address",
                //     border: OutlineInputBorder(
                //         borderSide: const BorderSide(color: Colors.black),
                //         borderRadius: BorderRadius.circular(8)),
                //   ),
                // ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      if (emailController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Email cannot be empty")));
                      } else {
                        if (_nameController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("Please enter your name")));
                        } else {
                          if (passController.text.isNotEmpty) {
                            if (passController.text ==
                                passConfirmationController.text) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProvidedStylesExample(
                                    menuScreenContext: context,
                                  ),
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content:
                                          Text("Password does not match")));
                            }
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text("Create a password")));
                          }
                        }
                      }
                    },
                    child: const Text("Create Account"),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8), // <-- Radius
                      ),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
