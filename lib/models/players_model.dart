import 'package:FlutterStyle/models/player_model.dart';

class PlayersModel {
  List<Player> playerList = [];

  PlayersModel.fromJSON(dynamic json) {
    for (int i = 0; i < json.length; i++) {
      playerList.add(Player.fromJSON(json[i]));
    }
  }
}
