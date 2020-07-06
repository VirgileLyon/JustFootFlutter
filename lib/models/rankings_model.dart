import 'package:FlutterStyle/models/ranking_model.dart';

class RankingsModel {
  List<RankingModel> rankingList = [];

  RankingsModel.fromJson(dynamic json) {
    for (int i = 0; i < json['allRankings'].length; i++) {
      rankingList.add(RankingModel.fromJson(json['allRankings'][i]));
    }
  }
}
