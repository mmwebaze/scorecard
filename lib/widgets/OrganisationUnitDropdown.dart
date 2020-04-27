import 'package:flutter/material.dart';
import 'package:scorecard/models/OrganisationUnit.dart';
import 'package:scorecard/services/OrganisationUnitService.dart';

class OrganisationUnitDropdown extends StatefulWidget {
  final int levelId;
  OrganisationUnitDropdown(this.levelId){
    print("${this.levelId} ???");
  }
  @override
  _OrganisationUnitDropdownState createState() {

    return _OrganisationUnitDropdownState(this.levelId);
  }
}

class _OrganisationUnitDropdownState extends State<OrganisationUnitDropdown> {
  int levelId;
  List<OrganisationUnit> _orgUnits;
  _OrganisationUnitDropdownState(this.levelId) {
    print("_OrganisationUnitDropdownState");
    this._orgUnits = OrganisationUnitService().getOrganisationUnitsByLevel(this.levelId);
  }
  //List<OrganisationUnit> _orgUnits = OrganisationUnitService().getOrganisationUnitsByLevel(levelId);
  List<DropdownMenuItem<OrganisationUnit>> _dropDownMenuItems;
  OrganisationUnit _selectedOrgUnit;

  @override
  void initState(){
    _dropDownMenuItems = buildDropDownMenuItems(_orgUnits);
    _selectedOrgUnit = _dropDownMenuItems[0].value;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
          DropdownButton(
            value: _selectedOrgUnit,
            items: _dropDownMenuItems,
            onChanged: onChangeDropdownMenuItem,
          ),
        ]
    );
  }

  List<DropdownMenuItem<OrganisationUnit>> buildDropDownMenuItems(List orgUnits){
    List<DropdownMenuItem<OrganisationUnit>> items = new List();

    for(OrganisationUnit orgUnit in orgUnits){
      items.add(DropdownMenuItem(value: orgUnit, child: Text(orgUnit.name),));
    }
    return items;
  }
  onChangeDropdownMenuItem(OrganisationUnit orgUnit){
    setState(() {
      print(orgUnit.id);
      _selectedOrgUnit = orgUnit;
    });
  }
}