import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_top_game_selector/models/boardgame.dart';

class BoardGameCard extends StatelessWidget {
  BoardGameCard({this.boardGame}) : super();

  final BoardGame boardGame;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(8.0),
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Text(boardGame.name),
            Text("Ages ${boardGame.minAge} to ${boardGame.maxAge}", style: TextStyle(fontSize: 10)),
            Text("Players ${boardGame.minPlayers} to ${boardGame.maxPlayers}", style: TextStyle(fontSize: 10)),
          ],
        ),
      ),
    );
  }
}