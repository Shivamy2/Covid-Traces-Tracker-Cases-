import 'package:CovidTracker/constraints.dart';
import 'package:CovidTracker/home.dart';
import 'package:flutter/material.dart';

import 'chatRoom.dart';

class ConfirmationPage extends StatefulWidget {
  final String messageText;

  const ConfirmationPage({Key key, @required this.messageText})
      : super(key: key);

  @override
  _ConfirmationPageState createState() => _ConfirmationPageState();
}

Constraints color = new Constraints();

class _ConfirmationPageState extends State<ConfirmationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.check_circle,
                  color: Colors.green,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'Your Message has been sent Wait for\n 1hr for Response Processing',
                  style: new TextStyle(
                    color: color.cardDeathBg,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                    fontSize: 15.0,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: RichText(
                text: TextSpan(
                    text: 'Your Sent message is: ',
                    style: TextStyle(
                      // height: 2.8,
                      color: color.cardTotalBg,
                      fontStyle: FontStyle.italic,
                      fontSize: 15.0,
                    ),
                    children: [
                      TextSpan(
                        text: widget.messageText,
                        style: TextStyle(
                            color: color.writingSubHead,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Satisfy'),
                      ),
                    ]),
              ),
            ),
            FlatButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => HomePage()));
              },
              child: Text('Back To Home'),
            )
          ],
        ),
      ),
    );
  }
}
