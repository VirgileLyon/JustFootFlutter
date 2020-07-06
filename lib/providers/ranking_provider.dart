import 'package:FlutterStyle/models/rankings_model.dart';
import 'package:FlutterStyle/services/api_service.dart';
import 'package:flutter/foundation.dart';

class RankingProvider extends ChangeNotifier {
  RankingsModel _ranking;

  RankingsModel get ranking {
    return _ranking;
  }

  ApiService apiService = ApiService();

  Future<void> getRanking() async {
    try {
      _ranking = await apiService.getRanking();
      notifyListeners();
    } catch (error) {
      print('getRanking() error: $error');
      _ranking = null;
    }
  }
}
