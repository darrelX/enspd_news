import 'package:firebase_auth/firebase_auth.dart';
// import 'package:enspd_news/auth/authentification.dart';
import 'package:flutter/material.dart';
import 'package:enspd_news/auth/authentification.dart';
import 'package:enspd_news/services/firestore.dart';
import 'package:enspd_news/view/home/home_page.dart';
import 'package:enspd_news/widgets/snackbar_utils.dart';

class MyButton extends StatelessWidget {
  final GlobalKey<FormState> formField;
  final TextEditingController passwordController;
  final TextEditingController emailController;
  final String title;
  final Future<void> Function() ontap;

  const MyButton(
      {super.key,
      required this.formField,
      required this.passwordController,
      required this.emailController,
      required this.title,
      required this.ontap});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: () async {
        if (formField.currentState!.validate()) {
          await ontap();
        }
      },
      child: Container(
          width: width - 50,
          height: 50,
          decoration: BoxDecoration(color: Colors.orange),
          child: Center(
              child: Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ))),
    );
  }
}
