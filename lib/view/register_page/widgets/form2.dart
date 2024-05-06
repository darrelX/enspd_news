import 'package:enspd_news/widgets/my_button.dart';
import 'package:flutter/material.dart';

class Form2 extends StatefulWidget {
  final GlobalKey<FormState> formField;
  final double height;
  final PageController pagecontroller;
  const Form2(
      {super.key,
      required this.formField,
      required this.height,
      required this.pagecontroller});

  @override
  State<Form2> createState() => _Form2State();
}

class _Form2State extends State<Form2> {
  int _selectedItem1 = 1;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formField,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: widget.height * 0.24,
          ),
          GestureDetector(
              onTap: () => widget.pagecontroller.previousPage(
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.linear),
              child: const Text(
                "< back",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              )),
          const SizedBox(
            height: 25,
          ),
          RichText(
            text: const TextSpan(
                text: "2.",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 30),
                children: [
                  TextSpan(
                      text: " school", style: TextStyle(color: Colors.orange))
                ]),
          ),
          const SizedBox(
            height: 25,
          ),
          const Text("aka"),
          DropdownButtonFormField<int>(
            value: _selectedItem1,
            items: [1, 2, 3, 4, 5]
                .map((e) => DropdownMenuItem(
                      child: Text("$e"),
                      value: e,
                    ))
                .toList(),
            onChanged: (value) {
              setState(() {
                _selectedItem1 = value!;
              });
            },
          ),
        ],
      ),
    );
  }
}
