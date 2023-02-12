import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/dashboard.dart';
import 'package:flutter_application_1/screens/register_screen.dart';
import 'package:flutter_application_1/widgets/bottomNavBar.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      backgroundColor: Colors.grey[200],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "WELCOME",
                      style: TextStyle(fontSize: 26),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Container(
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
                        controller: _emailController,
                        cursorColor: Colors.black,
                        style: const TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          prefixIcon: Padding(
                              padding:
                                  const EdgeInsets.only(left: 30.0, right: 10),
                              child: Icon(Icons.email_outlined)),
                          labelText: "Email",
                          border: OutlineInputBorder(
                              //borderSide: const BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(50)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
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
                        controller: _passController,
                        obscureText: true,
                        cursorColor: Colors.black,
                        style: const TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          prefixIcon: Padding(
                            padding:
                                const EdgeInsets.only(left: 30.0, right: 10),
                            child: Icon(Icons.lock_outlined),
                          ),
                          labelText: "Password",
                          border: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(50)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    SizedBox(
                      width: 400,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_emailController.text.isNotEmpty &&
                              _passController.text.isNotEmpty) {
                            print("Email: ${_emailController.text}");
                            print("Password: ${_passController.text}");
                            Navigator.of(context).pushReplacement(
                                new MaterialPageRoute(
                                    builder: (context) =>
                                        new ProvidedStylesExample(
                                          menuScreenContext: context,
                                        )));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        "Email and Password are required")));
                          }
                        },
                        child: const Text("Sign In"),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(50), // <-- Radius
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text("Forgot Your Password?"),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(height: 150),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacement(
                            new MaterialPageRoute(
                                builder: (context) => new RegisterScreen()));
                      },
                      child: const Text(
                        "Don't have account? Sign Up",
                        //style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 10),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .pushReplacement(new MaterialPageRoute(
                                builder: (context) => new ProvidedStylesExample(
                                      menuScreenContext: context,
                                    )));
                        // Navigator.pop(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => ProvidedStylesExample(
                        //       menuScreenContext: context,
                        //     ),
                        //   ),
                        // );
                      },
                      child: const Text(
                        "Skip For Now",
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
