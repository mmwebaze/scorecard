import 'package:flutter/material.dart';
import 'package:scorecard/pages/HomePage.dart';
import 'package:scorecard/pages/IndicatorManagerPage.dart';
import 'package:scorecard/pages/SingleIndicatorPage.dart';

class RouteManager {

  static Route<dynamic> generateRoute(RouteSettings settings){
    final args = settings.arguments;

    switch(settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomePage(title: "SCORECARD",));

      case '/single_indicator_page':

        if (args is String){
          return MaterialPageRoute(
              builder: (_) => SingleIndicatorPage(data: args),
          );
        }

        return _errorRoute();

      case '/indicator_manager_page':

        return MaterialPageRoute(
          builder: (_) => IndicatorManagerPage(),
        );

      default:

        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute(){
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Error'),
          ),
          body: Center(
            child: Text('Error'),
          ),
        );
      }
    );
  }
}