import 'package:enspd_news/widgets/my_textfield.dart';
import 'package:flutter/material.dart';

List<int> list = [
  213,
  244,
  229,
  267,
  226,
  257,
  237,
  238,
  269,
  242,
  243,
  225,
  253,
  20,
  291,
  268,
  251,
  241,
  220,
  233,
  224,
  245,
  240,
  254,
  266,
  231,
  218,
  261,
  265,
  223,
  212,
  230,
  222,
  258,
  264,
  227,
  234,
  256,
  250,
  239,
  221,
  248,
  232,
  252,
  249,
  211,
  255,
  235,
  228,
  216,
  260,
  263
];

class Form1 extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController passwordController;
  final TextEditingController confirmPassController;
  final TextEditingController contactController;
  final GlobalKey<FormState> formField;
  const Form1({
    super.key,
    required this.formField,
    required this.emailController,
    required this.firstNameController,
    required this.lastNameController,
    required this.passwordController,
    required this.confirmPassController,
    required this.contactController,
  });

  @override
  State<Form1> createState() => _Form1State();
}

class _Form1State extends State<Form1> {
  bool passToggle = true;
  bool confirmPassToggle = true;
  int _selectedItem = 237;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Form(
      key: widget.formField,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: height * 0.2,
          ),
          RichText(
            text: const TextSpan(
                text: "1.",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 30),
                children: [
                  TextSpan(
                      text: " personal", style: TextStyle(color: Colors.orange))
                ]),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                constraints: BoxConstraints(maxWidth: width * 0.44),
                child: MyTextField(
                  controller: widget.firstNameController,
                  hintText: "First Name",
                  validator: (value) {
                    bool emailValid = RegExp(r"^[a-zA-Z\s]+$").hasMatch(value!);
                    if (value.isEmpty) {
                      return "Enter your first name";
                    } else if (!emailValid) {
                      return "Enter Valid first name";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.name,
                  prefixIcon: const Icon(Icons.person),
                ),
              ),
              Container(
                constraints: BoxConstraints(maxWidth: width * 0.44),
                child: MyTextField(
                  controller: widget.lastNameController,
                  hintText: "Last Name",
                  validator: (value) {
                    bool emailValid = RegExp(r"^[a-zA-Z\s]+$").hasMatch(value!);
                    if (value.isEmpty) {
                      return "Enter your last name";
                    } else if (!emailValid) {
                      return "Enter Valid last name";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.name,
                  prefixIcon: const Icon(Icons.person),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: width * 0.20,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black)),
                child: Center(
                  child: DropdownButtonFormField<int>(
                    decoration: const InputDecoration(border: InputBorder.none),
                    value: _selectedItem,
                    items: list
                        .map((e) => DropdownMenuItem(
                              value: e,
                              child: Text("$e"),
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedItem = value!;
                      });
                    },
                    onSaved: (value){
                      
                    },
                  ),
                ),
              ),
              SizedBox(
                width: width * 0.6,
                child: MyTextField(
                  controller: widget.contactController,
                  hintText: "Phone Number",
                  validator: (value) {
                    bool emailValid = RegExp(r'\b\d{6,}\b').hasMatch(value!);
                    if (value.isEmpty) {
                      return "Enter your phone number";
                    } else if (!emailValid) {
                      return "Enter Valid phone number (You must start with your code country)";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                  prefixIcon: const Icon(Icons.phone),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          MyTextField(
            controller: widget.emailController,
            hintText: "Email",
            validator: (value) {
              bool emailValid = RegExp(
                      r"^[a-zA-z0-9.a-zA-Z0-9.!#$%&'*+=/=?_{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                  .hasMatch(value!);
              if (value.isEmpty) {
                return "Enter Email";
              } else if (!emailValid) {
                return "Enter Valid Email";
              }
              return null;
            },
            keyboardType: TextInputType.emailAddress,
            prefixIcon: const Icon(Icons.email),
          ),
          const SizedBox(
            height: 20,
          ),
          MyTextField(
              controller: widget.passwordController,
              hintText: "PassWord",
              validator: (value) {
                if (value!.isEmpty) {
                  return "Enter Password";
                } else if (widget.passwordController.text.length < 6) {
                  return "Password Lenght Should be more than 6 characters";
                }
                return null;
              },
              keyboardType: TextInputType.visiblePassword,
              obscureText: passToggle,
              prefixIcon: const Icon(Icons.lock),
              suffixIcon: InkWell(
                onTap: () {
                  setState(() {
                    passToggle = !passToggle;
                  });
                },
                child:
                    Icon(passToggle ? Icons.visibility_off : Icons.visibility),
              )),
          const SizedBox(
            height: 20,
          ),
          MyTextField(
              controller: widget.confirmPassController,
              hintText: "Confirm PassWord",
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please entrer re-password";
                } else if (widget.confirmPassController.text !=
                    widget.confirmPassController.text) {
                  return "Password Doesn't Match";
                }
                return null;
              },
              keyboardType: TextInputType.visiblePassword,
              obscureText: confirmPassToggle,
              prefixIcon: const Icon(Icons.lock),
              suffixIcon: InkWell(
                onTap: () {
                  setState(() {
                    confirmPassToggle = !confirmPassToggle;
                  });
                },
                child: Icon(confirmPassToggle
                    ? Icons.visibility_off
                    : Icons.visibility),
              )),
        ],
      ),
    );
  }
}
