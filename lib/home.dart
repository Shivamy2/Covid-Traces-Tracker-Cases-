import 'package:CovidTracker/CustomHeader.dart';
import 'package:CovidTracker/body.dart';
import 'package:CovidTracker/constraints.dart';
import 'package:CovidTracker/customnavbar.dart';
import 'package:flutter/material.dart';
import 'customappbar.dart';

Constraints color = new Constraints();

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            CustomAppBar(),
            SizedBox(
              height: MediaQuery.of(context).size.height -
                  CustomHeader().preferredSize.height -
                  CustomBottomBar().preferredSize.height -
                  25,
              child: MyCustomBody(),
            ),
          ],
        ),
        bottomNavigationBar: MyCustomNavBar(),
      ),
    );
  }
}
