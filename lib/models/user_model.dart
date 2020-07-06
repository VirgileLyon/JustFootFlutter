import 'package:FlutterStyle/models/asset_model.dart';
import 'package:FlutterStyle/models/team_model.dart';

class UserModel {
  String id;
  String fisrtName;
  String lastName;
  String email;
  String createdAt;
  String password;
  TeamModel team;
  Asset avatar;
  List<UserModel> friends;
  bool passwordIsSet;
  bool isAdmin;
  String description =
      "Enter a short description of yourself here, so that other users know a little more about you.";

  UserModel.fromJsonRegister(Map<String, dynamic> json) {
    id = json["createUser"]["id"];
    email = json["createUser"]["email"];
    fisrtName = json["createUser"]["firstName"];
    lastName = json["createUser"]["lastName"];
  }

  UserModel.fromJsonLogin(Map<String, dynamic> json) {
    id = json["id"];
    email = json["email"];
    fisrtName = json["firstName"];
    lastName = json["lastName"];
  }
}
