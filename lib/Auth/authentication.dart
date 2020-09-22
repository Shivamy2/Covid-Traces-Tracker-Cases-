import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

FirebaseAuth auth = FirebaseAuth.instance;
final googleSignIn = GoogleSignIn();

//error handling dialog box

showErrorDialog(BuildContext context, String err) {
  FocusScope.of(context).requestFocus(new FocusNode());

  return showDialog(
    context: context,
    child: AlertDialog(
      title: Text(
        "Error Occured",
      ),
      content: Text(err),
      actions: [
        OutlineButton(
          child: Text("OK"),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    ),
  );
}

Future<bool> googleSignInAcc() async {
  GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();

  if (googleSignInAccount != null) {
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);

    UserCredential result = await auth.signInWithCredential(credential);
    User user = await auth.currentUser;
    print(user.uid);
    return Future.value(true);
  }
}

Future<bool> signOutUser() async {
  User user = await auth.currentUser;
  // print(user.providerData[1].providerId);
  // if (user.providerData[1].providerId == 'google.com') {
  //   await googleSignIn.disconnect();
  //   print('sign out 1');
  // }
  user.delete();
  // await googleSignIn.disconnect();
  return Future.value(true);
}
