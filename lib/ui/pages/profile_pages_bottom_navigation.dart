import 'package:flutter/material.dart';

class Profile_Pages_Bottom_Navigation extends StatelessWidget {
  const Profile_Pages_Bottom_Navigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(40),
      ),
      child: BottomNavigationBar(
        iconSize: 40,
        selectedIconTheme: IconThemeData(
          color: const Color(0xFF200087),
        ),
        unselectedIconTheme: IconThemeData(
          color: Colors.black12,
        ),
        items: const [
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Icon(Icons.home),
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Icon(Icons.search),
            ),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Icon(Icons.person),
            ),
            label: "Profile",
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Icon(Icons.run_circle_outlined),
            ),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
