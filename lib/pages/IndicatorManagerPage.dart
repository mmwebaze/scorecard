import 'package:flutter/material.dart';
import 'package:scorecard/models/Indicator.dart';
import 'package:scorecard/services/IndicatorService.dart';

class IndicatorManagerPage extends StatefulWidget {
  @override
  _IndicatorManagerPageState createState() => _IndicatorManagerPageState();
}

class _IndicatorManagerPageState extends State<IndicatorManagerPage> {
  bool monVal = false;
  List<Widget> widgets = new List<Widget>();

  _IndicatorManagerPageState(){
    List<Indicator> indicators = IndicatorService().getIndicators();
    for(Indicator indicator in indicators){
      widgets.add(indicatorCheckbox(indicator.name, indicator.isEnabled));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Indicators"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
            children: widgets,
        ),
      ),
    );
  }
  Widget indicatorCheckbox(String title, bool boolValue){

    return Row(
      children: <Widget>[
        Checkbox(
          value: boolValue,
          onChanged: (bool value) {
            setState(() {
              print('KITLO ${value}');
              boolValue = value;
            });
          },
        ),
        Text(title),
      ],
    );
  }
}
