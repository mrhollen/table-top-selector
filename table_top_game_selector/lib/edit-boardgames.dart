import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_top_game_selector/data/sqlite.dart';
import 'package:table_top_game_selector/models/boardgame.dart';

class EditBoardGamesWidget extends StatefulWidget {
  EditBoardGamesWidget({Key key}) : super(key: key);

  final String title = "Board Games";
  final Sqlite sqlite = Sqlite();

  @override
  _EditBoardGamesState createState() => _EditBoardGamesState(sqlite: sqlite);
}

class _EditBoardGamesState extends State<EditBoardGamesWidget> {
  _EditBoardGamesState({this.sqlite});

  final Sqlite sqlite;

  Future<List<BoardGame>> _boardGames;

  Future<void> _addTestGame() async {
    BoardGame boardGame = BoardGame("Test Board Game", 5);
    try {
      await sqlite.insertBoardGame(boardGame);
    } finally {
      _boardGames = sqlite.getAllBoardGames();
    }
  }

  @override
  Widget build(BuildContext context) {
    _boardGames = sqlite.getAllBoardGames();

    Widget boardGameListWidget() {
      return FutureBuilder(
        future: _boardGames,
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return Text("Loading...");
          }

          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              BoardGame boardGame = snapshot.data[index];
              return Text(boardGame.name); // TODO: Replace with nice card widget or something
            }
          );
        },
      );
    }

    return Scaffold(
        appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: boardGameListWidget()
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTestGame,
        tooltip: 'Add Test Game',
        child: Icon(Icons.add),
      ),
    );
  }
}