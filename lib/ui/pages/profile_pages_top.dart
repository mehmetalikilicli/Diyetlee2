import 'package:diyetlee/main.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as math;
import 'package:intl/intl.dart';

class Profile_Pages_Top extends StatelessWidget {
  const Profile_Pages_Top({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final today = DateTime.now();

    return Positioned(
      top: 0,
      height: height * 0.35,
      left: 0,
      right: 0,
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(
          bottom: const Radius.circular(40),
        ),
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.only(
            top: 40,
            left: 24,
            right: 32,
            bottom: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                title: Text(
                  "${DateFormat.EEEE().format(today)}, ${DateFormat("d MMMM").format(today)}",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                  ),
                ),
                subtitle: Text(
                  "Hello, Ali",
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 26,
                    color: Colors.black,
                  ),
                ),
                trailing: ClipOval(child: Image.asset("assets/user.jpg")),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  _RadiusProgress(
                    width: width * 0.38,
                    height: width * 0.38,
                    progress: 0.7,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _IngredientProgress(
                        ingredien: "Protein",
                        leftAmount: 72,
                        progress: 0.6,
                        progressColor: Colors.green,
                        width: width * 0.25,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      _IngredientProgress(
                        ingredien: "Carbs",
                        leftAmount: 222,
                        progress: 0.7,
                        progressColor: Colors.red,
                        width: width * 0.25,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      _IngredientProgress(
                        ingredien: "Fat",
                        leftAmount: 61,
                        progress: 0.3,
                        progressColor: Colors.yellow,
                        width: width * 0.25,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _IngredientProgress extends StatelessWidget {
  final String ingredien;
  final double leftAmount;
  final double progress;
  final double width;
  final Color progressColor;
  const _IngredientProgress(
      {Key? key,
      required this.ingredien,
      required this.progress,
      required this.leftAmount,
      required this.progressColor,
      required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          ingredien.toUpperCase(),
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w700,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Stack(
              children: [
                Container(
                  height: 10,
                  width: width,
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                ),
                Container(
                  height: 10,
                  width: width * progress,
                  decoration: BoxDecoration(
                    color: progressColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 10,
            ),
            Text("${leftAmount}g left"),
          ],
        ),
      ],
    );
  }
}

class _RadiusProgress extends StatelessWidget {
  final double height, width, progress;

  const _RadiusProgress(
      {Key? key,
      required this.height,
      required this.width,
      required this.progress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _RadialPainter(progress: 0.7),
      child: Container(
        height: height,
        width: width,
        child: Center(
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: "1731",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF200087),
                  ),
                ),
                TextSpan(text: "\n"),
                TextSpan(
                  text: "kcal left",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF200087),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      //color: Colors.grey,
    );
  }
}

class _RadialPainter extends CustomPainter {
  final double progress;

  _RadialPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..strokeWidth = 10
      ..color = Color(0xFF200087)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Offset center = Offset(size.width / 2, size.height / 2);
    double relativeProgress = 360 * progress;
    //canvas.drawCircle(center, size.width / 2, paint);
    canvas.drawArc(Rect.fromCircle(center: center, radius: size.width / 2),
        math.radians(-90), math.radians(-relativeProgress), false, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(CustomPainter oldDelegate) => false;
}
