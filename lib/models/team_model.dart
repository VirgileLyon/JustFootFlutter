import 'package:FlutterStyle/models/players_model.dart';
import 'game_model.dart';

class TeamModel {
  int apiId;
  String name;
  String logo;
  String stadium;
  PlayersModel players;
  List<Game> games;
  // a supprimer par la suite (rank, imgUrl, score),
  // pour le moment c'est pour pas casser les fake data utilisées dans home_screen
  int rank;
  String imgUrl;
  int score;

  TeamModel.fromJsonMyTeam(Map<String, dynamic> json) {
    apiId = json["apiId"];
    name = json["name"];
    logo = json["logo"];
    stadium = json["stadium"];
    players = PlayersModel.fromJSON(json["players"]);
  }

  TeamModel.fromJsonTeamSelection(Map<String, dynamic> json) {
    apiId = json["apiId"];
    name = json["name"];
    logo = json["logo"];
    stadium = json["stadium"];
  }
}
