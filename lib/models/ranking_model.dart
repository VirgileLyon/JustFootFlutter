class RankingModel {
  int rank;
  int teamId;
  String teamName;
  String logo;
  int points;
  DateTime updatedAt;
  DateTime savedAt;

  RankingModel.fromJson(Map<String, dynamic> json) {
    rank = json["rank"];
    logo = json["logo"];
    teamName = json["teamName"];
    points = json["points"];
  }
}
