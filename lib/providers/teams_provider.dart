import 'package:FlutterStyle/models/team_model.dart';
import 'package:FlutterStyle/models/teams_model.dart';
import 'package:FlutterStyle/services/api_service.dart';
import 'package:flutter/foundation.dart';

class TeamsProvider extends ChangeNotifier {
  TeamsModel _teams;
  TeamModel _myTeam;

  TeamsModel get allTeams {
    return _teams;
  }

  TeamModel get myTeam {
    return _myTeam;
  }

  ApiService apiService = ApiService();

  Future<void> getTeams() async {
    try {
      _teams = await apiService.getAllTeams();
      notifyListeners();
    } catch (error) {
      print('getTeams() error: $error');
      _teams = null;
    }
  }

  Future<void> getMyTeams(myTeamId) async {
    try {
      _myTeam = await apiService.getMyTeams(myTeamId);
      notifyListeners();
    } catch (error) {
      print('getMyTeams() error: $error');
      _myTeam = null;
    }
  }
}
