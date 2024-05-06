import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class NaviationBar extends StatefulWidget {
  const NaviationBar({
    super.key,
  });

  @override
  State<NaviationBar> createState() => _NaviationBarState();
}

class _NaviationBarState extends State<NaviationBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    // bool _selectIndex = true;
    return Container(
      color: Colors.orange.withOpacity(0.7),
      height: height * 0.08,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: GNav(
          // backgroundColor: Colors.orange.withOpacity(0.7),
          color: Colors.grey,
          activeColor: Colors.orange,
          tabBackgroundColor: Colors.white,

          // tabBorder: Border.all(color: Colors.orange),
          onTabChange: (index) {
            setState(() {
              _currentIndex = index;
              print(_currentIndex);
            });
          },
          gap: 7,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          tabs: [
            GButton(
              border:
                  _currentIndex == 0 ? Border.all(color: Colors.orange) : null,
              icon: Icons.home,
              text: 'Home',
            ),
            GButton(
              border:
                  _currentIndex == 1 ? Border.all(color: Colors.orange) : null,
              icon: Icons.message,
              text: 'Message',
            ),
            GButton(
              border:
                  _currentIndex == 2 ? Border.all(color: Colors.orange) : null,
              icon: Icons.book,
              text: 'favorites',
            ),
            GButton(
              border:
                  _currentIndex == 3 ? Border.all(color: Colors.orange) : null,
              icon: Icons.person,
              text: 'Person',
            ),
          ]),
    );
  }
}
