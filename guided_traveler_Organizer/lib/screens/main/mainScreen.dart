import 'package:flutter/material.dart';
import 'package:guided_traveler/screens/main/home/home_Screen.dart';
import 'package:guided_traveler/screens/main/map/map_Screen.dart';
import 'package:guided_traveler/screens/main/profile/profile_Screen.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:badges/badges.dart' as badges;

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  //-------store the active index
  int activeIndex = 0;

  //----trigger when bottom nav item is clicked
  void onItemTapped(int val) {
    setState(() {
      activeIndex = val;
    });
  }

  //-------screen list
  final List<Widget> _screens = [
    homeScreen(),
    const Map(),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: _screens.elementAt(activeIndex),
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                color: Colors.black.withOpacity(.1),
              )
            ],
          ),
          child: SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
              child: GNav(
                rippleColor: Colors.grey[300]!,
                hoverColor: Colors.grey[100]!,
                gap: 8,
                activeColor: Colors.black,
                iconSize: 24,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                duration: Duration(milliseconds: 400),
                tabBackgroundColor: Colors.grey[100]!,
                color: Colors.black,
                tabs: const [
                  GButton(
                    icon: LineIcons.home,
                    text: 'Home',
                  ),
                  GButton(
                    icon: LineIcons.map,
                    text: 'Map',
                  ),
                  GButton(
                    icon: LineIcons.user,
                    text: 'Profile',
                  ),
                ],
                selectedIndex: activeIndex,
                onTabChange: (index) {
                  setState(() {
                    activeIndex = index;
                  });
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
