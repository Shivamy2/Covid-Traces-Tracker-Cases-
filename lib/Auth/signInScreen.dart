import 'package:CovidTracker/Auth/authentication.dart';
import 'package:CovidTracker/Auth/chatRoom.dart';
import 'package:CovidTracker/constraints.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

var authentication = FirebaseAuth.instance.currentUser;
Constraints color = new Constraints();

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 30.0,
        ),
        Container(
          height: 180,
          width: MediaQuery.of(context).size.width - 30,
          decoration: new BoxDecoration(
            color: color.cardActiveBg,
            borderRadius: new BorderRadius.all(Radius.circular(30.0)),
          ),
          child: Row(
            children: [
              Image.asset(
                'assets/images/chat.png',
                height: 170.0,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0, left: 15.0),
                child: Column(
                  children: [
                    Text(
                      'SignIn',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                          fontSize: 28.0),
                    ),
                    Text(
                      'To Chat',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                          fontSize: 30.0),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        Center(
          child: Image.asset(
            'assets/images/googleLogo.png',
            height: 100.0,
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        InkWell(
          onTap: () => googleSignInAcc().whenComplete(() async {
            User user = await FirebaseAuth.instance.currentUser;
            Navigator.of(context)
                .pushReplacement(MaterialPageRoute(builder: (_) => ChatRoom()));
          }),
          child: Container(
            width: MediaQuery.of(context).size.width / 1.3,
            height: 60.0,
            decoration: new BoxDecoration(
                borderRadius: new BorderRadius.circular(50.0),
                color: color.primary),
            child: Row(
              children: [
                SizedBox(
                  width: 20.0,
                ),
                Image.asset(
                  'assets/images/googleLogo.png',
                  height: 45.0,
                ),
                SizedBox(
                  width: 20.0,
                ),
                Text(
                  'Sign in with Google',
                  style: new TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
