import 'package:CovidTracker/CustomHeader.dart';
import 'package:CovidTracker/body.dart';
import 'package:CovidTracker/constraints.dart';
import 'package:flutter/material.dart';
import 'package:CovidTracker/customappbar.dart';

import 'CurePage.dart';

Constraints color = new Constraints();

// MyCustomNavBar obj = new MyCustomNavBar();

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final navigations = [
    CureInfoPage(),
    MyCustomBody(),
    MyCustomBody(),
    MyCustomBody(),
    MyCustomBody(),
  ];
  int currentIndex = 2;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            CustomAppBar('assets/images/refresh.png', 'assets/images/menu.png',
                '/home', 'Covid TRACES'),
            SizedBox(
              height: MediaQuery.of(context).size.height -
                  CustomHeader().preferredSize.height -
                  CustomBottomBar().preferredSize.height -
                  31.8,
              child: navigations[currentIndex],
            ),
          ],
        ),
        bottomNavigationBar: CustomBottomBar(
          height: MediaQuery.of(context).size.height / 14,
          child: BottomNavigationBar(
            elevation: 30.0,
            currentIndex: currentIndex,
            backgroundColor: Colors.blue,
            items: [
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/images/add.png',
                  height: 20.0,
                  width: 20.0,
                  color: Colors.green[700],
                ),
                backgroundColor: Colors.grey[100],
                title: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(
                    'Health',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'DancingScript',
                    ),
                  ),
                ),
              ),
              BottomNavigationBarItem(
                backgroundColor: Colors.grey[200],
                icon: Image.asset(
                  'assets/images/about.png',
                  height: 20.0,
                  width: 20.0,
                  color: Colors.red,
                ),
                title: Text(
                  'About',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'DancingScript',
                    color: Colors.black,
                  ),
                ),
              ),
              BottomNavigationBarItem(
                backgroundColor: Colors.grey[300],
                icon: Icon(
                  Icons.home,
                  color: Colors.green[700],
                ),
                title: Text(
                  'Home',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'DancingScript',
                    color: Colors.black,
                  ),
                ),
              ),
              BottomNavigationBarItem(
                backgroundColor: Colors.grey[200],
                icon: Image.asset(
                  'assets/images/contact.png',
                  height: 20.0,
                  width: 20.0,
                  color: Colors.red,
                ),
                title: Text(
                  'Contact',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'DancingScript',
                    color: Colors.black,
                  ),
                ),
              ),
              BottomNavigationBarItem(
                backgroundColor: Colors.grey[100],
                icon: Image.asset(
                  'assets/images/chat.png',
                  height: 20.0,
                  width: 20.0,
                  color: Colors.green[700],
                ),
                title: Text(
                  'Chat',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'DancingScript',
                    color: Colors.black,
                  ),
                ),
              ),
            ],
            onTap: (value) {
              setState(() {
                currentIndex = value;
              });
            },
          ),
        ),
      ),
    );
  }
}
