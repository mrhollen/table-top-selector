import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_top_game_selector/boardgame-card.dart';
import 'package:table_top_game_selector/data/sqlite.dart';
import 'package:table_top_game_selector/header-error-message.dart';
import 'package:table_top_game_selector/models/boardgame.dart';

class EditBoardGamesWidget extends StatefulWidget {
  EditBoardGamesWidget() : super();

  final String title = "Board Games";
  final Sqlite sqlite = Sqlite();

  @override
  _EditBoardGamesState createState() =>
      _EditBoardGamesState(sqlite: sqlite);
}

class _EditBoardGamesState extends State<EditBoardGamesWidget> {
  _EditBoardGamesState({this.sqlite});

  final Sqlite sqlite;

  Future<List<BoardGame>> _boardGames;
  HeaderErrorMessage errorMessage;

  Future<void> _addTestGame() async {
    BoardGame boardGame = BoardGame("Test Board Game", 5);
    try {
      await sqlite.insertBoardGame(boardGame);
    } catch(ex) {
      errorMessage = HeaderErrorMessage(
        header: "Could not add board game",
        message: "Is there an existing board game with the same name?",
        closeCallBack: () => this.setState(() => this.errorMessage = HeaderErrorMessage())
      );
    }finally {
      setState(() {
        _boardGames = sqlite.getAllBoardGames();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    errorMessage = HeaderErrorMessage();
    _boardGames = sqlite.getAllBoardGames();
  }

  @override
  Widget build(BuildContext context) {
    Widget boardGameListWidget() {
      return FutureBuilder(
        future: _boardGames,
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            errorMessage = HeaderErrorMessage(
                header: "",
                message: "",
                closeCallBack: () => this.setState(() => this.errorMessage = HeaderErrorMessage())
            );
            return Center(child: Text(""));
          }

          return ListView.builder(
            shrinkWrap: true,
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              BoardGame boardGame = snapshot.data[index];
              return Container(child: BoardGameCard(boardGame: boardGame));
            }
          );
        },
      );
    }

    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        errorMessage,
        boardGameListWidget(),
      ],
    );
  }
}