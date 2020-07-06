import 'team_model.dart';

class Game {
  List<TeamModel> teams;
  DateTime eventDate;
  int round;
  String score;
  String status;

  Game(this.teams, this.eventDate, this.round, this.score, this.status);
}
