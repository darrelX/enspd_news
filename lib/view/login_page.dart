// import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:enspd_news/auth/authentification.dart';
import 'package:enspd_news/view/home/home_page.dart';
import 'package:enspd_news/view/register_page/register_screen.dart';
import 'package:enspd_news/view/reset_password_pae.dart';
import 'package:enspd_news/widgets/my_button.dart';
import 'package:enspd_news/widgets/my_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final formField = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  bool passToggle = true;
  final Auth auth = Auth();

  @override
  void initState() {
    super.initState();
  }

  Future _signIn() async {
    try {
      await Auth.signInWithEmailAndPassword(
        context,
        email: emailController.text,
        password: passwordController.text,
      );
    } on FirebaseAuthException catch (e) {
      print("Error Error $e");
      if (!context.mounted) return;

      if (e.code == 'user-not-found') {
        // await showSnackBarMessage(
        //   "No user found for that email.",
        // );
      } else if (e.code == 'wrong-password') {
        // await showSnackBarMessage(
        //   "Wrong password provided for that user.",
        // );
      }
    }

    // Firestore.userName = value;
    if (Auth.userId != null) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              // ignore: prefer_const_constructors
              builder: (context) => HomeScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.05),
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  "Sign In .",
                  style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange),
                ),
                const Text(
                  "Your dynamic and personalized online learning companion.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
                SizedBox(height: height / 12),
                Form(
                  key: formField,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MyTextField(
                        prefixIcon: const Icon(Icons.person),
                        controller: emailController,
                        hintText: 'Email Address or Number',
                        obscureText: false,
                        validator: (value) {
                          bool emailValid = RegExp(
                                  r"^[a-zA-z0-9.a-zA-Z0-9.!#$%&'*+=/=?_{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value!);
                          bool numberValid =
                              RegExp(r'^\+\d{1,3} \d{1,}$').hasMatch(value);
                          if (value.isEmpty) {
                            return "Enter your Address or Number";
                          } else if (!emailValid && !numberValid) {
                            debugPrint(emailController.text);

                            return "Enter Valid Address or Number";
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 30),

                      // password textfield
                      MyTextField(
                        prefixIcon: const Icon(Icons.lock),
                        controller: passwordController,
                        hintText: 'Password',
                        obscureText: passToggle,
                        suffixIcon: InkWell(
                          onTap: () {
                            setState(() {
                              passToggle = !passToggle;
                            });
                          },
                          child: Icon(passToggle
                              ? Icons.visibility_off
                              : Icons.visibility),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter Password";
                          } else if (passwordController.text.length < 6) {
                            return "Password Lenght Should be more than 6 characters";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                              onTap: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ResetPassWordPage())),
                              child: const Text("Forget Password")),
                        ],
                      )

                      // sign in button
                    ],
                  ),
                ),
                SizedBox(height: height / 12),
                MyButton(
                  widget: const Text(
                    "Login",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  passwordController: passwordController,
                  emailController: emailController,
                  formField: formField,
                  ontap: _signIn,
                  color: Colors.blue.shade700,
                ),

                const SizedBox(height: 50),

                // or continue with
                Container(
                  // margin: const EdgeInsets.only(top: 12),
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Or continue with',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height * 0.06),
                // google + facebook sign in buttons
                MyButton(
                    widget: Container(
                      width: width - 50,
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(width: 2, color: Colors.blue),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // google button
                          Image.asset(
                            "assets/logo/google-logo.png",
                            height: 25,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            "Sign In with Google",
                            style: TextStyle(fontSize: 15),
                          )
                        ],
                      ),
                    ),
                    color: Colors.white,
                    ontap: () => Auth.hangleSignIn().then((value) {
                          if (Auth.userId != null) {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    // ignore: prefer_const_constructors
                                    builder: (context) => HomeScreen()));
                          }
                        })),

                const SizedBox(height: 20),

                // not a member? register now
                Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Not a member?',
                        style:
                            TextStyle(color: Colors.grey[1000], fontSize: 15),
                      ),
                      // SizedBox(width: width / 5),
                      TextButton(
                        onPressed: () {
                          // Image image = Image.asset('image.jpg');Z

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const RegisterScreen()),
                          );
                        },
                        child: const Text(
                          'Register now',
                          style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
