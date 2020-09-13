import 'package:flutter/material.dart';
import 'CustomGridview.dart';
import 'MapIntegration.dart';

class MyCustomBody extends StatefulWidget {
  @override
  _MyCustomBodyState createState() => _MyCustomBodyState();
}

class _MyCustomBodyState extends State<MyCustomBody> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            overflow: Overflow.visible,
            children: [
              CustomPaint(
                painter: MyCustomPainter(),
                child: ClipPath(
                  clipper: MyCustomClip(),
                  child: Container(
                    decoration: new BoxDecoration(
                      gradient: new LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          color.custombarG1,
                          color.custombarG2,
                        ],
                      ),
                    ),
                    height: height / 2 - 50,
                    width: width,
                  ),
                ),
              ),
              Positioned(
                left: -40.0,
                top: -5.0,
                child: Image.asset(
                  'assets/images/covid3.png',
                  height: 310.0,
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 2.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'CoVID-19',
                        style: TextStyle(
                          color: color.writingTitle,
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Text(
                          'TRACKER',
                          style: TextStyle(
                            color: color.primary,
                            fontSize: 30.0,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            height: 1.8,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 40),
                        child: Text(
                          '+',
                          style: TextStyle(
                            color: color.writingHead,
                            fontSize: 35.0,
                            height: 0.75,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 12.0),
                        child: Text(
                          'CASES',
                          style: TextStyle(
                            color: color.writingTitle,
                            fontSize: 30.0,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                      Text(
                        'IN SECONDS',
                        style: TextStyle(
                          color: color.writingSubHead,
                          fontSize: 35.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                          height: 2.0,
                        ),
                      ),
                      Text(
                        'WorldWide',
                        style: TextStyle(
                          color: color.writingTitle,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                          height: 3.2,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          MyCustomGridview(),
          MapIntegration(),
          SizedBox(height: 15.0),
          Text(
            '@2020 Covid Traces All Rights Reserved',
            style: TextStyle(
              fontFamily: 'satisfy',
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class MyCustomClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = new Path();
    path.lineTo(0.0, size.height - 100);
    var firstCPoint = new Offset((size.width / 4) - 20, (size.height) / 2 - 50);
    var firstEPoint = new Offset((size.width / 2 + 30), size.height - 70);
    path.quadraticBezierTo(
        firstCPoint.dx, firstCPoint.dy, firstEPoint.dx, firstEPoint.dy);
    var secondCPoint = new Offset(size.width * 0.9, size.height + 45);
    var secondEPoint = new Offset(size.width, size.height / 2 + 35);
    path.quadraticBezierTo(
        secondCPoint.dx, secondCPoint.dy, secondEPoint.dx, secondEPoint.dy);

    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class MyCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path = new Path();
    path.lineTo(0.0, size.height - 100);
    var firstCPoint = new Offset((size.width / 4) - 20, (size.height) / 2 - 50);
    var firstEPoint = new Offset((size.width / 2 + 30), size.height - 70);
    path.quadraticBezierTo(
        firstCPoint.dx, firstCPoint.dy, firstEPoint.dx, firstEPoint.dy);
    var secondCPoint = new Offset(size.width * 0.9, size.height + 45);
    var secondEPoint = new Offset(size.width, size.height / 2 + 35);
    path.quadraticBezierTo(
        secondCPoint.dx, secondCPoint.dy, secondEPoint.dx, secondEPoint.dy);

    path.lineTo(size.width, 0.0);
    path.close();
    canvas.drawShadow(path, color.custombarG2, 30.0, false);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
