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
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "SIGN UP",
                style: TextStyle(fontSize: 26),
              ),
              SizedBox(height: 50),
              _buildRegisterForm(
                  controller: emailController,
                  label: "Email",
                  icon: Icon(Icons.email_outlined),
                  passObscure: false),
              const SizedBox(
                height: 20,
              ),
              _buildRegisterForm(
                  controller: passController,
                  label: "Create Password",
                  icon: Icon(Icons.lock_outlined),
                  passObscure: true),
              const SizedBox(
                height: 20,
              ),
              _buildRegisterForm(
                  controller: passConfirmationController,
                  label: "Confirm Password",
                  icon: Icon(Icons.lock_outlined),
                  passObscure: true),
              const SizedBox(
                height: 20,
              ),
              _buildRegisterForm(
                  controller: _nameController,
                  label: "Full Name",
                  icon: Icon(Icons.person_outlined),
                  passObscure: false),
              const SizedBox(
                height: 20,
              ),
              _buildRegisterForm(
                  controller: _phoneController,
                  label: "Phone",
                  icon: Icon(Icons.phone_outlined),
                  passObscure: false),
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
                height: 50,
              ),
              SizedBox(
                width: 400,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    if (emailController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
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
                                    content: Text("Password does not match")));
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
                      borderRadius: BorderRadius.circular(50), // <-- Radius
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRegisterForm(
      {required TextEditingController controller,
      required String label,
      required Icon icon,
      required bool passObscure}) {
    return Container(
      width: 400,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 4,
            blurRadius: 5,
            offset: Offset(0, 8), // changes position of shadow
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        cursorColor: Colors.black,
        style: const TextStyle(color: Colors.black),
        obscureText: passObscure,
        decoration: InputDecoration(
          prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 10),
              //child: Icon(Icons.email_outlined)),
              child: icon),
          labelText: label,
          border: OutlineInputBorder(
              //borderSide: const BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(50)),
        ),
      ),
    );
  }
}
