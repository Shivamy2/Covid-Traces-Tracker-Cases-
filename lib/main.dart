import 'package:CovidTracker/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Covid Traces(Tracker + Cases)',
    initialRoute: '/home',
    onGenerateRoute: RouteGenerator.generateRoute,
  ));
}
