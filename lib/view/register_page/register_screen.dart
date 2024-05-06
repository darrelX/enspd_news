import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:enspd_news/view/register_page/widgets/form1.dart';
import 'package:enspd_news/view/register_page/widgets/form2.dart';
import 'package:enspd_news/widgets/my_button.dart';
import 'package:enspd_news/widgets/my_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:enspd_news/auth/authentification.dart';
import 'package:enspd_news/services/firestore.dart';
import 'package:enspd_news/view/login_page.dart';
import 'package:enspd_news/widgets/snackbar_utils.dart';
import 'package:flutter/widgets.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formField1 = GlobalKey<FormState>();
  final GlobalKey<FormState> _formField2 = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPassController = TextEditingController();
  final contactController = TextEditingController();
  final _pagecontroller = PageController();
  bool passToggle = false;
  bool confirmPassToggle = false;
  bool isLoading = false;
  bool _isLastPage = false;
  late ScaffoldMessengerState scaffoldMessenger = ScaffoldMessenger.of(context);
  final db = FirebaseFirestore.instance;
  final auth = Auth();
  late UserCredential? credential;

  void submit(GlobalKey<FormState> formField) async {
    if (formField.currentState!.validate()) {
      try {
        await Auth.createUserWithEmailAndPassword(emailController.text,
            passwordController.text, showSnackBarMessage as BuildContext);
        final user = Firestore(
            firstName: firstNameController.text,
            lastName: lastNameController.text,
            number: contactController.text,
            email: emailController.text,
            password: passwordController.text);
        Firestore.userName = firstNameController.text;
        user.uploadData().then((value) {
          if (Auth.userId != null) {
            Navigator.push(
                context,
                // ignore: prefer_const_constructors
                MaterialPageRoute(builder: (context) => LoginScreen()));
          }
        });
      } catch (e) {
        print("Erreur lors de la recuperation de l'utilisateur $e");
      }
      print("Data Added Successfully");
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
        child: Stack(alignment: Alignment.topCenter, children: [
          PageView(
              controller: _pagecontroller,
              physics: const NeverScrollableScrollPhysics(),
              onPageChanged: (value) {
                setState(() {
                  _isLastPage = (value == 1);
                });
              },
              children: [
                Form1(
                    formField: _formField1,
                    emailController: emailController,
                    firstNameController: firstNameController,
                    lastNameController: lastNameController,
                    passwordController: passwordController,
                    confirmPassController: confirmPassController,
                    contactController: contactController),
                Form2(
                    formField: _formField2,
                    height: height,
                    pagecontroller: _pagecontroller)
              ]),
          Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Sign Up.",
                style: TextStyle(
                  fontSize: 50,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Your dynamic and personalized online learning companion.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 570,
              ),
              !_isLastPage
                  ? MyButton(
                      widget: const Text(
                        "Next >",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ontap: () {
                        if (_formField1.currentState!.validate()) {
                          _pagecontroller.jumpToPage(1);
                        }
                      },
                      color: Colors.blue.shade600,
                    )
                  : MyButton(
                      widget: isLoading
                          ? const CircularProgressIndicator()
                          : const Text(
                              "Create Account",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                      ontap: () => submit(_formField2),
                      color: Colors.blue.shade600,
                    ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        text: "Already have an account?   ",
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        children: [
                          TextSpan(
                              text: "Sign In",
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.orange),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginScreen()),
                                  );
                                })
                        ])),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
