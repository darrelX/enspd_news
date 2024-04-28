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
    // bool _selectIndex = true;
    return Container(
      color: Colors.orange.withOpacity(0.7),
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
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
              icon: Icons.person,
              text: 'Person',
            ),
            GButton(
              border:
                  _currentIndex == 2 ? Border.all(color: Colors.orange) : null,
              icon: Icons.favorite_border,
              text: 'favorites',
            ),
            GButton(
              border:
                  _currentIndex == 3 ? Border.all(color: Colors.orange) : null,
              icon: Icons.book,
              text: 'Librairies',
            ),
          ]),
    );
  }
}
