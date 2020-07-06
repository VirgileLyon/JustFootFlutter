import 'package:FlutterStyle/models/team_model.dart';

class TeamsModel {
  List<TeamModel> teamList = [];

  TeamsModel.fromJson(dynamic json) {
    for (int i = 0; i < json['allTeams'].length; i++) {
      teamList.add(TeamModel.fromJsonTeamSelection(json['allTeams'][i]));
    }
  }
}
