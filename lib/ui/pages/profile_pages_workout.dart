import 'package:flutter/material.dart';

class Profile_Pages_Workout extends StatelessWidget {
  const Profile_Pages_Workout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Positioned(
      top: height * 0.7,
      left: 0,
      right: 0,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.orange, borderRadius: BorderRadius.circular(15)),
        height: height * 0.2,
        margin: const EdgeInsets.only(bottom: 10, left: 32, right: 32),
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Text(
              "WORKOUT ",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              "",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  iconSize: 64,
                  icon: Image.asset(
                    "assets/back.png",
                  ),
                  onPressed: () {},
                ),
                SizedBox(
                  width: 20,
                ),
                IconButton(
                  iconSize: 64,
                  icon: Image.asset(
                    "assets/biceps.png",
                  ),
                  onPressed: () {},
                ),
                SizedBox(
                  width: 20,
                ),
                IconButton(
                  iconSize: 64,
                  icon: Image.asset(
                    "assets/chest.png",
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
