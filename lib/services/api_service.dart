import 'package:FlutterStyle/graphql/query_all_teams.dart';
import 'package:FlutterStyle/graphql/query_team_by_id.dart';
import 'package:FlutterStyle/graphql/signin.dart';
import 'package:FlutterStyle/graphql/signup.dart';
import 'package:FlutterStyle/graphql/getRanking.dart';
import 'package:FlutterStyle/models/login_model.dart';
import 'package:FlutterStyle/models/rankings_model.dart';
import 'package:FlutterStyle/models/team_model.dart';
import 'package:FlutterStyle/models/teams_model.dart';
import 'package:FlutterStyle/models/user_model.dart';
import 'package:FlutterStyle/services/graphql_service.dart';

class ApiService {
  static final ApiService _singleton = ApiService._internal();

  factory ApiService() {
    return _singleton;
  }

  ApiService._internal();

  /* Regular class */
  GraphQLService graphQLService = GraphQLService();

  Future<UserModel> signIn(String email, String password) async {
    dynamic json = await graphQLService
        .mutation(signin, {"email": email, "password": password});
    LoginModel userlogin = LoginModel.fromJson(json);

    if (graphQLService.getToken == null) {
      graphQLService.setToken(userlogin.token);
    }

    return userlogin.user;
  }

  Future<UserModel> signUp(
      String firstName, String lastName, String email, String password) async {
    dynamic json = await graphQLService.mutation(signup, {
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "password": password
    });

    UserModel user = UserModel.fromJsonRegister(json);

    return user;
  }

  Future<RankingsModel> getRanking() async {
    dynamic json = await graphQLService.query(getRankingQuery, {});
    return RankingsModel.fromJson(json);
  }

  Future<TeamsModel> getAllTeams() async {
    dynamic json = await graphQLService.query(query_all_teams, {});
    return TeamsModel.fromJson(json);
  }

  Future<TeamModel> getMyTeams(teamId) async {
    dynamic json =
        await graphQLService.query(query_team_by_id, {"apiId": teamId});
    return TeamModel.fromJsonMyTeam(json["allTeams"][0]);
  }
}
