import 'package:CovidTracker/CustomHeader.dart';
import 'package:flutter/material.dart';
import 'constraints.dart';

Constraints color = new Constraints();

class CustomAppBar extends StatelessWidget {
  Widget IconsContainer(String imgsrc, String message) {
    return InkWell(
      onTap: () {
        print('$message');
      },
      child: Container(
        height: 55.0,
        width: 70.0,
        decoration: new BoxDecoration(
          color: color.primary,
          shape: BoxShape.circle,
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Image.asset(
            '$imgsrc',
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return CustomHeader(
      height: MediaQuery.of(context).size.height / 13.0,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Row(
              children: [
                IconsContainer('assets/images/menu.png', 'menu clicked...'),
                Spacer(),
                Text(
                  'CoVID TRACES',
                  style: TextStyle(
                    color: color.writingSubHead,
                    fontSize: MediaQuery.of(context).size.width / 13,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                IconsContainer('assets/images/refresh.png', 'refreshing...'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
