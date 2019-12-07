class BoardGame {
  String name;
  int minAge;
  int maxAge;
  int minPlayers;
  int maxPlayers;

  BoardGame(String name, int maxPlayers, [int minAge = 0, int maxAge = 100, minPlayers = 1]) {
    this.name = name;
    this.minAge = minAge;
    this.maxAge = maxAge;
    this.minPlayers = minPlayers;
    this.maxPlayers = maxPlayers;
  }

  BoardGame.fromDatabase({this.name, this.minAge, this.maxAge, this.minPlayers, this.maxPlayers});


  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'min_age': minAge,
      'max_age': maxAge,
      'min_players': minPlayers,
      'max_players': maxPlayers
    };
  }
}