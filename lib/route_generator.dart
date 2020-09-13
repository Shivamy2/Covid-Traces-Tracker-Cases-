import 'package:CovidTracker/CurePage.dart';
import 'package:CovidTracker/home.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/home':
        return MaterialPageRoute(builder: (_) => HomePage());
        break;
      case '/cureInfoPage':
        return MaterialPageRoute(builder: (_) => CureInfoPage());
        break;
      default:
        _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Column(
        children: [
          Center(
            child: Text(
              'Error. No Such Page exist',
              style: new TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
                fontSize: 20.0,
              ),
            ),
          )
        ],
      );
    });
  }
}
