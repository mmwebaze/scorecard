import 'package:flutter/material.dart';

class SingleIndicatorPage extends StatefulWidget {
  final String data;
  SingleIndicatorPage({Key key, this.data}) : super(key: key);

  @override
  _SingleIndicatorPageState createState() => _SingleIndicatorPageState();
}

class _SingleIndicatorPageState extends State<SingleIndicatorPage> {
  @override
  Widget build(BuildContext context) {
    return Text('Hello Next page'
    );
  }
}
