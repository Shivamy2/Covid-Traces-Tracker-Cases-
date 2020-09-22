import 'package:CovidTracker/Auth/authentication.dart';
import 'package:CovidTracker/Auth/confirmationPage.dart';
import 'package:CovidTracker/constraints.dart';
import 'package:CovidTracker/home.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatRoom extends StatefulWidget {
  // final String uid;
  // ChatRoom({Key key, @required this.uid}) : super(key: key);
  @override
  _ChatRoomState createState() => _ChatRoomState();
}

Constraints color = new Constraints();

class _ChatRoomState extends State<ChatRoom> {
  TextEditingController messageController = new TextEditingController();
  TextEditingController customMessage = TextEditingController();
  bool tickApprove = false;
  CollectionReference db =
      FirebaseFirestore.instance.collection('Chat Message');
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  String customValue;

  @override
  void dispose() {
    messageController.dispose();
    customMessage.dispose();
    super.dispose();
  }

  Future<Widget> dialogueDisplay(BuildContext context) {
    if (messageController.text != null) {
      if (messageController.text == '1') {
        return showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Message'),
                content: Container(
                  height: 80,
                  child: ListView(
                    physics: new NeverScrollableScrollPhysics(),
                    children: [
                      RichText(
                          text: TextSpan(
                        text: 'Contact : ',
                        style: TextStyle(
                          color: color.cardTotalBg,
                          fontFamily: 'Poppins',
                          fontSize: 20.0,
                        ),
                        children: [
                          TextSpan(
                            text: ' 7007723257',
                            style: new TextStyle(
                              fontSize: 20.0,
                              color: color.cardDeathBg,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      )),
                      SizedBox(
                        height: 20.0,
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: FlatButton(
                            onPressed: () {
                              print('ok clicked');
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              'Done',
                            )),
                      ),
                    ],
                  ),
                ),
              );
            });
      } else if (messageController.text == '2') {
        return showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Message'),
                content: Container(
                  height: 100,
                  child: Column(
                    children: [
                      Text(
                        'Enter your message',
                        style: new TextStyle(
                          color: color.cardDeathBg,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      Spacer(),
                      Form(
                        key: formKey,
                        child: TextFormField(
                          onSaved: (newValue) {
                            if (newValue != null) {
                              customValue = newValue;
                            }
                          },
                          controller: customMessage,
                          textInputAction: TextInputAction.done,
                          decoration: new InputDecoration(
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(30.0),
                              ),
                              labelText: 'Message',
                              labelStyle: new TextStyle(
                                color: color.writingSubHead,
                                fontStyle: FontStyle.italic,
                                fontFamily: 'DancingScript',
                              ),
                              suffixIcon: IconButton(
                                  icon: Icon(Icons.send),
                                  onPressed: () {
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (_) => ConfirmationPage(
                                                messageText: customValue)));
                                    setState(() {
                                      dbStorage();
                                    });
                                  })),
                        ),
                      ),
                    ],
                  ),
                ),
                actions: [
                  FlatButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => ChatRoom()));
                      },
                      child: Text('Back'))
                ],
              );
            });
      }
    }
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Message'),
            content: Column(
              children: [
                Text('Please Enter a valid Message'),
              ],
            ),
            actions: [
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    print('ok clicked');
                  },
                  child: Text(
                    'ok',
                  )),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              onPressed: () {
                signOutUser().whenComplete(() {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (_) => HomePage()));
                });
              },
              icon: Icon(
                Icons.exit_to_app,
                size: 40.0,
              ),
            ),
          ),
        ],
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context)
                .pushReplacement(MaterialPageRoute(builder: (_) => HomePage()));
          },
        ),
        backgroundColor: color.primary,
        title: Text(
          'Chat Room',
          style: new TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
          ),
        ),
      ),
      body: Column(
        children: [
          Spacer(
            flex: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Container(
                decoration: new BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                width: MediaQuery.of(context).size.width / 1.5,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '\nPress: \n\n 1. Connect Agent\n\n 2. Send Custom Message\n',
                    style: new TextStyle(
                      color: color.primary,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ),
            ),
          ),
          Spacer(),
          Container(
            width: MediaQuery.of(context).size.width - 20,
            padding: const EdgeInsets.only(bottom: 18.0),
            child: TextFormField(
              controller: messageController,
              textInputAction: TextInputAction.done,
              decoration: new InputDecoration(
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                  ),
                  labelText: 'Drop Message Here',
                  labelStyle: new TextStyle(
                    color: color.writingSubHead,
                    fontStyle: FontStyle.italic,
                    fontFamily: 'DancingScript',
                  ),
                  suffixIcon: IconButton(
                      icon: Icon(Icons.done_all),
                      onPressed: () {
                        dialogueDisplay(context);
                      })),
            ),
          ),
        ],
      ),
    );
  }

  void dbStorage() async {
    final formvalue = formKey.currentState;
    formvalue.save();
    if (formvalue.validate()) {
      db.add({
        'message': customValue,
      });
    }
  }
}
