import 'package:FlutterStyle/models/user_model.dart';
import 'package:FlutterStyle/services/api_service.dart';
import 'package:flutter/foundation.dart';

class UsersProvider extends ChangeNotifier {
  UserModel _user;

  UserModel get currentUser {
    return _user;
  }

  ApiService apiService = ApiService();

  Future<void> login(String email, String password) async {
    try {
    _user = await apiService.signIn(email, password);
    notifyListeners(); 
    } catch(error) {
      print('login() error: $error');
      _user = null;
    }

    print('UsersProviders login() _user $_user');
  }

  Future<void> register(String firstName, String lastName, String email, String password) async {
    try {
      _user = await apiService.signUp(firstName, lastName, email, password);
      notifyListeners();
    } catch(error) {
      print('register() error: $error');
    }
    print('UsersProviders login() _user $_user');
  }


  void logout() {
    _user = null;
    notifyListeners();
  }
}