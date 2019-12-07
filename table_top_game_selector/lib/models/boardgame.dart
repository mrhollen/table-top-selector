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
}