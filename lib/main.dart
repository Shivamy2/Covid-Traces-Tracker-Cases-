import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Covid Traces(Tracker + Cases)',
    home: HomePage(),
  ));
}
