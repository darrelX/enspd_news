import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final GlobalKey<FormState>? formField;
  final TextEditingController? passwordController;
  final TextEditingController? emailController;
  final Widget widget;
  final double? large;
  final Color? color;
  final BoxBorder? border;
  final void Function() ontap;

  const MyButton(
      {super.key,
      this.formField,
      this.passwordController,
      this.emailController,
      required this.widget,
      this.color,
      required this.ontap,
      this.large,
      this.border})
      : assert(
          formField == null &&
              passwordController == null &&
              emailController == null,
          'If formField is null, passwordController and emailController must also be null.',
        );

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: () {
        if (formField == null || formField!.currentState!.validate()) {
          return ontap();
        }
      },
      child: Container(
          width: large,
          height: 50,
          decoration: BoxDecoration(
              color: color,
              border: border ?? Border.all(color: Colors.blue),
              borderRadius: BorderRadius.circular(20)),
          child: Center(child: widget)),
    );
  }
}
