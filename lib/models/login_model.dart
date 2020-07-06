import 'package:FlutterStyle/models/user_model.dart';

class LoginModel {
  String token;
  UserModel user;

  LoginModel.fromJson(Map<String, dynamic> json) {
    token = json["authenticateUserWithPassword"]["token"];
    user =
        UserModel.fromJsonLogin(json["authenticateUserWithPassword"]["item"]);
  }
}
