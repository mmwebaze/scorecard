import 'package:flutter/material.dart';
import 'package:scorecard/services/IndicatorService.dart';
import '../models/Indicator.dart';

class IndicatorDropDown extends StatefulWidget {
  @override
  _IndicatorDropDownState createState() => _IndicatorDropDownState();
}

class _IndicatorDropDownState extends State<IndicatorDropDown> {
  List<Indicator> _indicators = IndicatorService().getIndicators();
  List<DropdownMenuItem<Indicator>> _dropDownMenuItems;
  Indicator _selectedIndicator;

  @override
  void initState(){
    _dropDownMenuItems = buildDropDownMenuItems(_indicators);
    _selectedIndicator = _dropDownMenuItems[0].value;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: _selectedIndicator,
      items: _dropDownMenuItems,
      onChanged: onChangeDropdownMenuItem,
    );
  }

  List<DropdownMenuItem<Indicator>> buildDropDownMenuItems(List indicators){
    List<DropdownMenuItem<Indicator>> items = new List();

    for(Indicator indicator in indicators){
      items.add(DropdownMenuItem(value: indicator, child: Text(indicator.name),));
    }
    return items;
  }

  onChangeDropdownMenuItem(Indicator selectedIndicator){
    setState(() {
      _selectedIndicator = selectedIndicator;
    });
  }
}