import 'package:flutter/material.dart';
import 'package:table_top_game_selector/color-pallet.dart';
import 'package:table_top_game_selector/edit-boardgames.dart';

import 'botton-nav.dart';
import 'game-selector.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tabletop Game Selector',
      theme: ThemeData(
        primarySwatch: ColorPallet.primary,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  final String title = "Tabletop Game Selector";

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  _MyHomePageState() : super() {
    bottomNav = BottomNav(callback: _setIndex);
  }

  final Map<int, Widget> widgets = {
    0: GameSelector(),
    1: EditBoardGamesWidget()
  };

  int index = 0;
  BottomNav bottomNav;

  void _setIndex(int i) {
    setState(() {
      this.index = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: widgets[index],
      ),
      bottomNavigationBar: bottomNav,
    );
  }
}
