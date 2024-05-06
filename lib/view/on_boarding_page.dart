import 'package:enspd_news/widgets/my_button.dart';
import 'package:enspd_news/widgets/story_telling.dart';
import 'package:flutter/material.dart';
import 'package:enspd_news/view/login_page.dart';
import 'package:enspd_news/view/register_page/register_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  // final PageController controller;
  const OnBoardingScreen({
    super.key,
  });

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pagecontroller = PageController();
  bool _onLastPage = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _pagecontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            PageView(
              controller: _pagecontroller,
              onPageChanged: (index) {
                setState(() {
                  _onLastPage = (index == 2);
                });
              },
              children: const [
                StoryTelling(
                    text1: "step into a world of ",
                    text2: "learning ",
                    text3: "exellence",
                    text4:
                        "Your dynamic and personalized online learning companion."),
                StoryTelling(
                    text1: "empower your ",
                    text2: "education ",
                    text3: "journey",
                    text4:
                        "Your dynamic and personalized online learning companion."),
                StoryTelling(
                    text1: "step into a world of ",
                    text2: "learning ",
                    text3: "exellence",
                    text4:
                        "Your dynamic and personalized online learning companion."),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 30),
              child: Visibility(
                visible: !_onLastPage,
                child: MyButton(
                  widget: Text(
                    "SKIP",
                    style: TextStyle(fontSize: 15),
                  ),
                  ontap: () => _pagecontroller.jumpToPage(2),
                  large: width * 0.1,
                  color: Colors.blue,
                ),
              ),
            ),
            Align(
              alignment: const FractionalOffset(0.5, 0.7),
              child: SmoothPageIndicator(
                  controller: _pagecontroller,
                  count: 3,
                  effect: const WormEffect(
                      spacing: 16,
                      dotColor: Colors.black26,
                      activeDotColor: Colors.orange),
                  onDotClicked: (index) => _pagecontroller.animateToPage(index,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeIn)),
            ),
            !_onLastPage
                ? Column(
                    children: [
                      SizedBox(
                        height: height * 0.8,
                      ),
                      MyButton(
                        widget: const Text(
                          'NEXT',
                          style: TextStyle(color: Colors.white),
                        ),
                        ontap: () => _pagecontroller.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut),
                        color: Colors.blue,
                      ),
                    ],
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: height * 0.76,
                      ),
                      MyButton(
                        widget: const Text(
                          "Sign up",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        color: Colors.blue,
                        ontap: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const RegisterScreen()));
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      MyButton(
                          widget: const Text(
                            "Login",
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ),
                          color: Colors.white,
                          ontap: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => const LoginScreen()));
                          }),
                    ],
                  )
          ],
        ),
      ),
    );
  }
}
