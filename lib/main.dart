import 'package:flutter/material.dart';
import 'package:scorecard/RouteManager.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MEASURE EVALUATION',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      onGenerateRoute: RouteManager.generateRoute,
    );
  }
}

