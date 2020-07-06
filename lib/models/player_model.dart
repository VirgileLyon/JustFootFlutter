class Player {
  String name;
  String position;
  double averageNote;

  Player(this.name, this.position, this.averageNote);

  Player.fromJSON(Map<String, dynamic> json) {
    name = json["name"];
    position = json["position"];
  }
}
