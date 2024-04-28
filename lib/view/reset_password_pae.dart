import 'package:flutter/material.dart';
import 'package:enspd_news/auth/authentification.dart';
import 'package:enspd_news/widgets/my_button.dart';
import 'package:enspd_news/widgets/my_textfield.dart';

class ResetPassWordPage extends StatefulWidget {
  const ResetPassWordPage({super.key});

  @override
  State<ResetPassWordPage> createState() => _ResetPassWordPageState();
}

class _ResetPassWordPageState extends State<ResetPassWordPage> {
  final GlobalKey<FormState> _formField = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _passToggle = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
              child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 50,
          ),
          const Text(
            "Reset Password",
            style: TextStyle(
              fontSize: 50,
            ),
          ),
          const Center(
            child: Text(
              "Lorem Marcel elan elan tu yah norr",
              maxLines: 1,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
          ),
          Form(
              key: _formField,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  children: [
                    const SizedBox(height: 80),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Email Here",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    const SizedBox(height: 15),
                    MyTextField(
                      prefix: const Icon(Icons.person),
                      controller: _emailController,
                      hintText: 'Email Address',
                      obscureText: false,
                      validator: (value) {
                        bool emailValid = RegExp(
                                r"^[a-zA-z0-9.a-zA-Z0-9.!#$%&'*+=/=?_{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value!);

                        if (value.isEmpty) {
                          return "Enter your Address or Number";
                        } else if (!emailValid) {
                          debugPrint(_emailController.text);

                          return "Enter Valid Address or Number";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Password",
                            style: TextStyle(fontWeight: FontWeight.bold))
                      ],
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      controller: _passwordController,
                      obscureText: _passToggle,
                      decoration: InputDecoration(
                          labelText: "PassWord",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: InkWell(
                            onTap: () {
                              setState(() {
                                _passToggle = !_passToggle;
                              });
                            },
                            child: Icon(_passToggle
                                ? Icons.visibility_off
                                : Icons.visibility),
                          )),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter Password";
                        } else if (_passwordController.text.length < 6) {
                          return "Password Lenght Should be more than 6 characters";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    MyButton(
                      title: 'Submit',
                      passwordController: _passwordController,
                      emailController: _emailController,
                      formField: _formField,
                      ontap: () => Auth.resetPassword(_emailController.text),
                    ),
                  ],
                ),
              ))
        ],
      ))),
    );
  }
}
