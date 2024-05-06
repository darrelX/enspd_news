import 'package:enspd_news/view/home/widgets/naviation_bar.dart';
import 'package:flutter/material.dart';
import 'package:enspd_news/auth/authentification.dart';
import 'package:enspd_news/model/camera_manager.dart';
// import 'package:enspd_news/view/camera_page.dart';
import 'package:enspd_news/view/home/main_piece.dart';
import 'package:enspd_news/widgets/my_app_bar.dart';

class HomeScreen extends StatefulWidget {
  final int currentTabIndex;
  const HomeScreen({super.key, this.currentTabIndex = 0});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final auth = Auth();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose;
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    final List<Widget> kTabPages = [
      const MainPiece(),
    ];

    return Scaffold(
      // ignore: prefer_const_constructors
      // appBar: MyAppBar(
      //   prefferedHeight: height * 0.07,
      // ),
      resizeToAvoidBottomInset: false,
      body: kTabPages[widget.currentTabIndex],
      bottomNavigationBar: const NaviationBar(),
    );
  }
}
