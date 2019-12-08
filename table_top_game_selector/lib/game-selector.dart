import 'package:flutter/cupertino.dart';
import 'package:table_top_game_selector/data/sqlite.dart';

class GameSelector extends StatefulWidget {
  @override
  _GameSelectorState createState() => _GameSelectorState(sqlite: Sqlite());
}

class _GameSelectorState extends State<GameSelector> {
  _GameSelectorState({this.sqlite}) : super();

  final Sqlite sqlite;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }
}