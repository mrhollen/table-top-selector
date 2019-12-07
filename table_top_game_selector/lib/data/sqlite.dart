import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:table_top_game_selector/models/boardgame.dart';

class Sqlite {
  final int versionNumber = 1;
  final String _tableName = "board_games";

  Future<String> _getDatabasePath() async {
    var path = await getDatabasesPath();
    return join(path, 'table-top-game-selector.db');
  }

  Future<Database> _getDatabase() async {
    var testGame = BoardGame("Test Game", 5);

    var path = await _getDatabasePath();
    return openDatabase(path,
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE $_tableName"
          "(name TEXT PRIMARY KEY, min_age INTEGER, max_age INTEGER, min_players INTEGER, max_players INTEGER);"
        );
      },
      version: versionNumber);
  }

  Future<void> insertBoardGame(BoardGame boardGame) async {
    final Database db = await _getDatabase();

    await db.insert(
      _tableName,
      boardGame.toMap(),
      conflictAlgorithm: ConflictAlgorithm.fail,
    );
  }

  Future<List<BoardGame>> getAllBoardGames() async {
    final Database database = await _getDatabase();

    final List<Map<String, dynamic>> maps = await database.query(_tableName);

    return List.generate(maps.length, (i) {
      return BoardGame.fromDatabase(
        name: maps[i]['name'],
        minAge: maps[i]['min_age'],
        maxAge: maps[i]['max_age'],
        minPlayers: maps[i]['min_players'],
        maxPlayers: maps[i]['max_players']
      );
    });
  }
}