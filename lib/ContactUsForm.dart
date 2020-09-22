import 'package:CovidTracker/CurePage.dart';
import "package:flutter/material.dart";
import 'package:cloud_firestore/cloud_firestore.dart';

class ContactUsForm extends StatefulWidget {
  @override
  _ContactUsFormState createState() => _ContactUsFormState();
}

class _ContactUsFormState extends State<ContactUsForm> {
  // FirebaseFirestore db = FirebaseFirestore.instance;
  CollectionReference db =
      FirebaseFirestore.instance.collection('Contact Data');
  String id;
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  String _fullName, _landmark, _address, _email, _description, _mobileNo;
  TextEditingController Email = new TextEditingController();
  TextEditingController MobileNumber = new TextEditingController();
  TextEditingController Landmark = new TextEditingController();
  TextEditingController Address = new TextEditingController();
  TextEditingController desCription = new TextEditingController();
  TextEditingController FullName = new TextEditingController();
  bool isDone = false, applicationDone = false;

  void saveData() async {
    final _formValue = _formKey.currentState;
    _formValue.save();
    if (_formValue.validate()) {
      isDone = true;
      applicationDone = true;
      db.add({
        'fullName': '$_fullName',
        'address': '$_address',
        'MobileNo': '$_mobileNo',
        'Landmark': '$_landmark',
        'description': '$_description',
        'email': '$_email'
      });
    }
  }

  @override
  void dispose() {
    Email.dispose();
    desCription.dispose();
    FullName.dispose();
    Address.dispose();
    Landmark.dispose();
    MobileNumber.dispose();
    super.dispose();
  }

  Widget thankuMessage() {
    if (isDone == true) {
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          child: Center(
            child: Text(
              'Thank You, Your Application Will Be Reviewed Within 1hr',
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                fontFamily: 'Satisfy',
                color: color.cardTotalBg,
              ),
            ),
          ),
        ),
      );
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
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
                  'assets/images/contact.png',
                  height: 200.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0, left: 8.0),
                  child: Column(
                    children: [
                      Text(
                        'CONTACT',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins',
                            fontSize: 28.0),
                      ),
                      Text(
                        'US',
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
          thankuMessage(),
          Container(
            width: MediaQuery.of(context).size.width - 20,
            decoration: new BoxDecoration(
              color: color.cardActiveFront,
              borderRadius: new BorderRadius.circular(30.0),
            ),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width - 80,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          applicationDone
                              ? 'Application Sent!!'
                              : 'Please input valid Information',
                          style: new TextStyle(
                            fontSize: 15.0,
                            fontFamily: 'Poppins',
                            color: color.cardDeathBg,
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        TextFormField(
                          controller: FullName,
                          validator: (input) {
                            if (input.length <= 5) {
                              if (input.isEmpty) {
                                return 'required field';
                              }
                              return 'Input is too short';
                            }
                          },
                          onSaved: (input) {
                            _fullName = input;
                          },
                          onEditingComplete: () =>
                              FocusScope.of(context).nextFocus(),
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            labelText: 'Full Name',
                            labelStyle: TextStyle(
                              fontFamily: 'DancingScript',
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        TextFormField(
                          textInputAction: TextInputAction.next,
                          controller: Address,
                          validator: (input) {
                            if (input.length <= 5) {
                              if (input.isEmpty) {
                                return 'required field';
                              }
                              return 'Input is too short';
                            }
                          },
                          onEditingComplete: () =>
                              FocusScope.of(context).nextFocus(),
                          onSaved: (input) {
                            _address = input;
                          },
                          decoration: InputDecoration(
                            labelText: 'QTR No',
                            labelStyle: TextStyle(
                              fontFamily: 'DancingScript',
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        TextFormField(
                          textInputAction: TextInputAction.next,
                          controller: MobileNumber,
                          validator: (input) {
                            if (input.length <= 5) {
                              if (input.isEmpty) {
                                return 'required field';
                              }
                              return 'Input is too short';
                            }
                          },
                          onEditingComplete: () =>
                              FocusScope.of(context).nextFocus(),
                          onSaved: (input) {
                            _mobileNo = input;
                          },
                          decoration: InputDecoration(
                            labelText: 'Mobile Number',
                            labelStyle: TextStyle(
                              fontFamily: 'DancingScript',
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        TextFormField(
                          textInputAction: TextInputAction.next,
                          onEditingComplete: () =>
                              FocusScope.of(context).nextFocus(),
                          controller: Email,
                          validator: (input) {
                            if (input.length <= 5) {
                              if (input.isEmpty) {
                                return 'required field';
                              }
                              return 'Input is too short';
                            }
                          },
                          onSaved: (input) {
                            _email = input;
                          },
                          decoration: InputDecoration(
                            labelText: 'Email',
                            labelStyle: TextStyle(
                              fontFamily: 'DancingScript',
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        TextFormField(
                          textInputAction: TextInputAction.next,
                          onEditingComplete: () =>
                              FocusScope.of(context).nextFocus(),
                          controller: Landmark,
                          validator: (input) {
                            if (input.length <= 5) {
                              if (input.isEmpty) {
                                return 'required field';
                              }
                              return 'Input is too short';
                            }
                          },
                          onSaved: (input) {
                            _landmark = input;
                          },
                          decoration: InputDecoration(
                            labelText: 'Landmark',
                            labelStyle: TextStyle(
                              fontFamily: 'DancingScript',
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        TextField(
                          textInputAction: TextInputAction.done,
                          onEditingComplete: () =>
                              FocusScope.of(context).nextFocus(),
                          controller: desCription,
                          onChanged: (value) {
                            _description = value;
                          },
                          decoration: InputDecoration(
                            labelText: 'Description',
                            labelStyle: TextStyle(
                              fontFamily: 'DancingScript',
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          maxLength: 500,
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width - 30,
                          child: RaisedButton(
                            onPressed: () {
                              print('Submit Clicked!');
                              saveData();
                              setState(() {
                                Email.clear();
                                desCription.clear();
                                FullName.clear();
                                Address.clear();
                                Landmark.clear();
                                MobileNumber.clear();
                              });
                            },
                            color: color.cardActiveBg,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Text(
                              'SEND',
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            '@2020 Covid Traces All Rights Reserved',
            style: TextStyle(
              fontFamily: 'satisfy',
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
