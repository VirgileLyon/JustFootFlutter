import 'package:FlutterStyle/models/ranking_model.dart';
import 'package:FlutterStyle/providers/ranking_provider.dart';
import 'package:FlutterStyle/widgets/coach_widget.dart';
import 'package:FlutterStyle/widgets/ranking_widget.dart';
import 'package:flutter/material.dart';
import 'package:FlutterStyle/models/coach_model.dart';
import 'package:FlutterStyle/models/player_ratings_model.dart';
import 'package:FlutterStyle/widgets/player_average_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen();

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<PlayerNotation> playerNotationList = [
    PlayerNotation('Zinedine Zidane', 'Real Madrid', 9.8,
        'https://gal.img.pmdstatic.net/fit/http.3A.2F.2Fprd2-bone-image.2Es3-website-eu-west-1.2Eamazonaws.2Ecom.2Fgal.2Fvar.2Fgal.2Fstorage.2Fimages.2Fmedia.2Fimages.2Factu.2Fphotos_c_est_suprenant.2Fzinedine_zidane.2F467131-1-fre-FR.2Fzinedine_zidane.2Ejpg/480x480/quality/80/zidane-retour-au-real-madrid.jpg'),
    PlayerNotation('Kylian Mbappé', 'Paris Saint Germain', 6,
        'https://thumbor.forbes.com/thumbor/fit-in/416x416/filters%3Aformat%28jpg%29/https%3A%2F%2Fspecials-images.forbesimg.com%2Fimageserve%2F5cfe85694c687b0008593562%2F0x0.jpg%3Fbackground%3D000000%26cropX1%3D19%26cropX2%3D1756%26cropY1%3D210%26cropY2%3D1948'),
    PlayerNotation('Dembélé Moussa', 'Olympique Lyonnais', 4,
        'http://photos.madeingones.com/photos/joueurs/289781.jpg')
  ];

  final List<Coach> coachList = [
    Coach('Stephane Moulin', 'angers SCO', 9.8,
        'https://www.allezpaillade.com/wp-content/uploads/2019/03/a654e774b73c221368d34b4da8c71c2a-angers-sco-stephane-moulin-s-est-calque-sur-montpellier.jpg'),
    Coach('Rudi Garcia', 'Olympique Lyonnais', 6,
        'https://le10static.com/img/cache/article/576x324/0000/0016/168656.jpeg'),
    Coach('Julien Stephan', 'Stade Rennais', 4,
        'https://mvistatic.com/photosmvi/2019/11/28/P21793458D3922238G.jpg')
  ];

  List<RankingModel> rankingList;

  @override
  void initState() {
    RankingProvider provider =
        Provider.of<RankingProvider>(context, listen: false);
    provider.getRanking();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    RankingProvider provider = Provider.of<RankingProvider>(context);

    if (provider.ranking == null) {
      print("rankingList is loading");
    } else {
      rankingList = provider.ranking.rankingList;
      rankingList.sort((a, b) => a.rank.compareTo(b.rank));
    }

    if (rankingList == null) {
      return Center(child: CircularProgressIndicator());
    } else {
      return ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                  child: Center(
                    child: Text('Top Players'),
                  ),
                ),
                ...playerNotationList.map((player) {
                  return PlayerAverage(player);
                }).toList()
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                  child: Center(
                    child: Text('Top Coachs'),
                  ),
                ),
                ...coachList.map((coach) {
                  return CoachWidget(coach);
                }).toList()
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                  child: Center(
                    child: Text('Ranking'),
                  ),
                ),
                ...rankingList.map((team) {
                  return RankingWidget(team);
                }).toList(),
              ],
            ),
          ),
        ],
      );
    }
  }
}
