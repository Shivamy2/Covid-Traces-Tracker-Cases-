import 'package:CovidTracker/CustomHeader.dart';
import 'package:CovidTracker/constraints.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

Constraints color = new Constraints();

class MyCustomNavBar extends StatefulWidget {
  @override
  _MyCustomNavBarState createState() => _MyCustomNavBarState();
}

class _MyCustomNavBarState extends State<MyCustomNavBar> {
  @override
  Widget build(BuildContext context) {
    return CustomBottomBar(
      height: MediaQuery.of(context).size.height / 16,
      child: CurvedNavigationBar(
        height: 50.0,
        index: 2,
        color: Colors.black,
        animationCurve: Curves.linear,
        backgroundColor: Colors.transparent,
        animationDuration: new Duration(
          milliseconds: 200,
        ),
        items: [
          Image.asset(
            'assets/images/add.png',
            height: 30.0,
            width: 30.0,
            color: Colors.green[100],
          ),
          Image.asset(
            'assets/images/about.png',
            height: 30.0,
            width: 30.0,
            color: Colors.red[50],
          ),
          Image.asset(
            'assets/images/home.png',
            height: 40.0,
            width: 40.0,
            color: Colors.white,
          ),
          Image.asset(
            'assets/images/contact.png',
            height: 30.0,
            width: 30.0,
            color: Colors.red[50],
          ),
          Image.asset(
            'assets/images/chat.png',
            height: 30.0,
            width: 30.0,
            color: Colors.green[100],
          ),
        ],
      ),
    );
  }
}
