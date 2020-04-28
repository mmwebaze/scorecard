import 'package:flutter/material.dart';
import 'package:scorecard/menus/MenuItems.dart';
import 'package:scorecard/widgets/IndicatorDropdown.dart';
import 'package:scorecard/widgets/LevelDropdown.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: menuChoice,
            itemBuilder: (BuildContext context) {
              return MenuItems.MENUITEMS.map((String choice){
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 40.0,
            ),
            IndicatorDropDown(),
            SizedBox(
              height: 40.0,
            ),
            LevelDropdown(),
          ],
        ),
      ),
    );
  }

  void menuChoice(String menuChoice) {

    if (menuChoice == MenuItems.INDICATORS){
      Navigator.of(context).pushNamed(
        '/indicator_manager_page'
      );
    }
    else if (menuChoice == MenuItems.ORGUNITS){
      print(menuChoice);
    }
    else if (menuChoice == MenuItems.SETTINGS){
      print(menuChoice);
    }
  }
}
