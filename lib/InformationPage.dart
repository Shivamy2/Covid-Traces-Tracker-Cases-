import 'package:flutter/material.dart';

import 'CustomHeader.dart';

class InformationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget cardView(
        BorderRadius brd,
        String headText,
        String bodyText,
        String data2,
        String data3,
        String data4,
        Color bgColor,
        Color frontColor) {
      return SizedBox(
        height: 300.0,
        width: MediaQuery.of(context).size.width,
        child: Card(
          color: bgColor,
          elevation: 8.0,
          shape: RoundedRectangleBorder(
            borderRadius: brd,
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
              SizedBox(height: 8.0),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  data2,
                  style: TextStyle(
                    fontSize: 15.0,
                    color: frontColor,
                    fontFamily: 'DancingScript',
                  ),
                ),
              ),
              SizedBox(height: 8.0),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  data3,
                  style: TextStyle(
                    fontSize: 15.0,
                    color: frontColor,
                    fontFamily: 'DancingScript',
                  ),
                ),
              ),
              SizedBox(height: 8.0),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  data4,
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
                            'assets/images/covid2.png',
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
                                    'Basic',
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
                                    'INFORMATION',
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
                                    'What You',
                                    style: TextStyle(
                                      color: color.cardActiveBg,
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30.0,
                                      height: 2,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 12.0),
                                  child: Text(
                                    'Can Do',
                                    style: TextStyle(
                                        color: color.cardTotalBg,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30.0,
                                        fontStyle: FontStyle.italic,
                                        height: 0.75),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 28.0),
                                  child: Text(
                                    'With This',
                                    style: TextStyle(
                                      color: color.writingTitle,
                                      fontSize: 30.0,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Satisfy',
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 12.0),
                                  child: Text(
                                    'App?',
                                    style: TextStyle(
                                      color: color.cardDeathFront,
                                      fontSize: 35.0,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'DancingScript',
                                      height: 0.75,
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
                      height: 60,
                    ),
                    cardView(
                        BorderRadius.only(
                          topRight: Radius.circular(50.0),
                          bottomLeft: Radius.circular(50.0),
                        ),
                        'Tracking Information',
                        '* You can easily Track informations i.e. track daily cases, recovered, deaths as well as active live cases. You have to only refresh and wait for the fresh result.',
                        '* You have to just click at top-left corner for refreshing the page and reset thing the will do by itself.',
                        '* We have integrated pi chart for easy and quick review of the CoVID-19 data. Differenet color indicators are also used there for full information.',
                        '* Map Integration is also done for Indian map only. We will try to integrate World Map in nearby future and update the current Indian map with some more specified data.',
                        Colors.purple[50],
                        color.cardTotalBg),
                    cardView(
                        BorderRadius.only(
                          topLeft: Radius.circular(50.0),
                          bottomRight: Radius.circular(50.0),
                        ),
                        'Contact Us',
                        '* We have provided the Exclusive feature in our CoVID-app. In this feature you will be able to Contact Us and specially our team will handle the entire task.',
                        '* We will verify your information with our record and if that will be genuine then further task will be performed.',
                        '* You can contact us if you want any special or emergency treatement (if you are in need). Don\'t give us any false statement otherwise Strict Action will be taken and Police Invovement may be occur.',
                        '* Feel free to contact us when you are actually in need. We will stand for you support at that time. Don\'t worry about any charges. We will manage if you problem will be considerable.',
                        color.cardDeathFront,
                        color.cardDeathBg),
                    cardView(
                        BorderRadius.only(
                          topRight: Radius.circular(50.0),
                          bottomLeft: Radius.circular(50.0),
                        ),
                        'Chat Feature',
                        '* We have recently added chat feature in our CoVID APP through which you will be able to chat with our team in seconds.',
                        '* You can share your views and any inprovement in our App will be taken into consideration. Any mishappening or non-treatement will also be judged.',
                        '* NO CHAT BOT we have supported. The person who will talk to you in this app will be from our team and not an outsider or other.',
                        '* We know that CHAT feature is not developed yet in our APP. But you will definitely get an exclusive expereince while talking to our team.',
                        color.cardActiveFront,
                        Colors.orange[700]),
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
