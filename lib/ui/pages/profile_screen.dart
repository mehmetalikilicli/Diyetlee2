import 'package:diyetlee/model/meal.dart';
import 'package:diyetlee/ui/pages/profile_pages_bottom_navigation.dart';
import 'package:diyetlee/ui/pages/profile_pages_meals.dart';
import 'package:diyetlee/ui/pages/profile_pages_top.dart';
import 'package:diyetlee/ui/pages/profile_pages_workout.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xFFE9E9E9),
      body: SizedBox(
        height: height,
        width: width,
        child: Stack(
          children: const <Widget>[
            Profile_Pages_Top(),
            Profile_Pages_Meals(),
            Profile_Pages_Workout(),
          ],
        ),
      ),
      bottomNavigationBar: const Profile_Pages_Bottom_Navigation(),
    );
  }
}
