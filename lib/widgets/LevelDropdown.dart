import 'package:flutter/material.dart';
import 'package:scorecard/models/Level.dart';
import 'package:scorecard/services/LevelService.dart';
import 'package:scorecard/widgets/OrganisationUnitDropdown.dart';
import 'package:scorecard/models/OrganisationUnit.dart';
import 'package:scorecard/services/OrganisationUnitService.dart';

class LevelDropdown extends StatefulWidget {

  @override
  _LevelDropdownState createState() => _LevelDropdownState();
}

class _LevelDropdownState extends State<LevelDropdown> {
  int _orgUnit = 0;

  List<Level> _levels = LevelService().getLevels();
  List<OrganisationUnit> _orgUnits = OrganisationUnitService().getOrganisationUnitsByLevel(1);
  List<DropdownMenuItem<OrganisationUnit>> _dropDownOrgUnitMenuItems;

  List<DropdownMenuItem<Level>> _dropDownMenuItems;
  Level _selectedLevel;
  OrganisationUnit _selectedOrgUnit;

  showScoreCard() {
    setState(() {
      print("${this._orgUnit} - selected");
    });
  }

  @override
  void initState(){
    _dropDownMenuItems = buildLevelDropDownMenuItems(_levels);
    _selectedLevel = _dropDownMenuItems[0].value;

    _dropDownOrgUnitMenuItems = buildOrgUnitsDropDownMenuItems(_orgUnits);
    _selectedOrgUnit = _dropDownOrgUnitMenuItems[0].value;
    //this.orgUnit = OrganisationUnitDropdown(_selectedLevel.id);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        DropdownButton(
          value: _selectedLevel,
          items: _dropDownMenuItems,
          onChanged: onChangeLevelDropdownMenuItem,
        ),
        SizedBox(
          height: 40.0,
        ),
        DropdownButton(
          value: _selectedOrgUnit,
          items: _dropDownOrgUnitMenuItems,
          onChanged: onChangeOrgUnitDropdownMenuItem,
        ),
        SizedBox(
          height: 40.0,
        ),
        RaisedButton(
          padding: const EdgeInsets.all(8.0),
          textColor: Colors.white,
          color: Colors.blue,
          onPressed: showScoreCard,
          child: new Text("Add"),
        )
      ]
    );
  }

  List<DropdownMenuItem<Level>> buildLevelDropDownMenuItems(List levels){
    List<DropdownMenuItem<Level>> items = new List();

    for(Level level in levels){
      items.add(DropdownMenuItem(value: level, child: Text(level.name),));
    }
    return items;
  }

  List<DropdownMenuItem<OrganisationUnit>> buildOrgUnitsDropDownMenuItems(List orgUnits){
    List<DropdownMenuItem<OrganisationUnit>> items = new List();

    for(OrganisationUnit orgUnit in orgUnits){
      items.add(DropdownMenuItem(value: orgUnit, child: Text(orgUnit.name),));
    }
    return items;
  }

  onChangeLevelDropdownMenuItem(Level selectedLevel){
    setState(() {
      print("setting state 0");
      _selectedLevel = selectedLevel;
      print("setting state 1${selectedLevel.id}");
      //this.orgUnit = OrganisationUnitDropdown(selectedLevel.id);
      this._orgUnits = OrganisationUnitService().getOrganisationUnitsByLevel(selectedLevel.id);

      this._dropDownOrgUnitMenuItems = this.buildOrgUnitsDropDownMenuItems(this._orgUnits);
      _selectedOrgUnit = _dropDownOrgUnitMenuItems[0].value;
    });
  }
  onChangeOrgUnitDropdownMenuItem(OrganisationUnit orgUnit){
    setState(() {
      this._orgUnit = orgUnit.id;
      print("${this._orgUnit} - selected org unit*");
      _selectedOrgUnit = orgUnit;
    });
  }
}
