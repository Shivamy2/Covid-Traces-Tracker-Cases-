import 'package:CovidTracker/CustomHeader.dart';
import 'package:flutter/material.dart';
import 'constraints.dart';

Constraints color = new Constraints();

class CustomAppBar extends StatefulWidget {
  String appBarIconText1;
  String appBarIconText2;
  String path;
  String text;
  CustomAppBar(
      this.appBarIconText1, this.appBarIconText2, this.path, this.text);
  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  Widget IconsContainer(String imgsrc, String path) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(path);
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
    return CustomHeader(
      height: MediaQuery.of(context).size.height / 13.0,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Row(
              children: [
                IconsContainer(widget.appBarIconText1, widget.path),
                Spacer(),
                Text(
                  widget.text,
                  style: TextStyle(
                    color: color.writingSubHead,
                    fontSize: MediaQuery.of(context).size.width / 13,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                IconsContainer(widget.appBarIconText2, widget.path),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
