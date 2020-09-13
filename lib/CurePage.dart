import 'package:CovidTracker/CustomHeader.dart';
import 'package:CovidTracker/constraints.dart';
import 'package:flutter/material.dart';

Constraints color = new Constraints();

class CureInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    cardView(
        String headText, String bodyText, Color frontColor, Color bgColor) {
      return SizedBox(
        height: 135.0,
        width: MediaQuery.of(context).size.width,
        child: Card(
          color: bgColor,
          elevation: 8.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
          child: Column(
            children: [
              Text(
                headText,
                style: TextStyle(
                  color: frontColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  fontFamily: 'Poppins',
                ),
              ),
              SizedBox(height: 8.0),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  bodyText,
                  style: TextStyle(
                    fontSize: 15.0,
                    color: frontColor,
                    fontFamily: 'DancingScript',
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height -
                  CustomHeader().preferredSize.height -
                  CustomBottomBar().preferredSize.height -
                  31.8,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      overflow: Overflow.visible,
                      children: [
                        Positioned(
                          left: -60.0,
                          top: -5.0,
                          child: Image.asset(
                            'assets/images/covid4.png',
                            height: 340.0,
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 2.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 25.0, top: 10.0),
                                  child: Text(
                                    'Health',
                                    style: TextStyle(
                                      color: color.writingTitle,
                                      fontSize: 40.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Text(
                                    'ISSUES?',
                                    style: TextStyle(
                                      color: color.writingTitle,
                                      fontSize: 30.0,
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 30),
                                  child: Text(
                                    'FOLLOW',
                                    style: TextStyle(
                                      color: color.primary,
                                      fontStyle: FontStyle.italic,
                                      fontSize: 25.0,
                                      height: 2,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 12.0),
                                  child: Text(
                                    'STEPS',
                                    style: TextStyle(
                                      color: color.primary,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30.0,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 28.0),
                                  child: Text(
                                    'Home',
                                    style: TextStyle(
                                      color: color.writingTitle,
                                      fontSize: 30.0,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Satisfy',
                                      height: 3.2,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 12.0),
                                  child: Text(
                                    'Treatement',
                                    style: TextStyle(
                                      color: color.writingTitle,
                                      fontSize: 35.0,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'DancingScript',
                                      height: 0.25,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    cardView(
                        'Step 1',
                        'Take atleast half glass of Kadha everyday. This will build your immunity so that your body is fit to fight with CoVID-19',
                        Colors.purple[50],
                        color.cardTotalBg),
                    cardView(
                        'Step 2',
                        'Always wear mask when go outside. Nowadays Corona is becomming common for everyone but still we have to take care of our body by ourself. Wearing mask will save us from other people\'s sneeze and other harmful touches',
                        Colors.orange[50],
                        color.cardActiveBg),
                    cardView(
                        'Step 3',
                        'If you havve gloves then it\'s good, use it. But if you don\'t then wash your hand in every 10 mins of interval to kill then germs',
                        color.cardDeathFront,
                        color.cardDeathBg),
                    cardView(
                        'Step 4',
                        'Away from your family. Always wash your hands or sanitize. This will make your family healthy forever and no germs will touch you and your family.',
                        color.cardRecoverFront,
                        color.cardRecoverBg),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
