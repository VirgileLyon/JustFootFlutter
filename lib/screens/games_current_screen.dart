import 'package:FlutterStyle/widgets/team_versus_logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:FlutterStyle/models/player_model.dart';
import 'package:FlutterStyle/widgets/player_rating_card_widget.dart';

class GamesCurrentTab extends StatefulWidget {
  @override
  _GamesCurrentTabState createState() => _GamesCurrentTabState();
}

class _GamesCurrentTabState extends State<GamesCurrentTab> {
  List<Player> players = [
    Player('Housem Aouar', 'Attaquant', 8.3),
    Player('Anthony lopes', 'Gardien', 8.3),
    Player('Jeff Rene Adelaide', 'Milieu', 8.3),
    Player('Housem Aouar', 'Attaquant', 8.3),
    Player('Anthony lopes', 'Gardien', 8.3),
    Player('Jeff Rene Adelaide', 'Milieu', 8.3),
    Player('Housem Aouar', 'Attaquant', 8.3),
    Player('Anthony lopes', 'Gardien', 8.3),
    Player('Jeff Rene Adelaide', 'Milieu', 8.3),
    Player('Housem Aouar', 'Attaquant', 8.3),
    Player('Anthony lopes', 'Gardien', 8.3),
    Player('Jeff Rene Adelaide', 'Milieu', 8.3),
  ];

  String homeTeamLogo =
      "https://upload.wikimedia.org/wikipedia/fr/thumb/e/e2/Olympique_lyonnais_%28logo%29.svg/1200px-Olympique_lyonnais_%28logo%29.svg.png";
  int homeTeamScore = 2;
  String awayTeamLogo =
      "https://upload.wikimedia.org/wikipedia/fr/thumb/4/4a/Paris_Saint-Germain_Football_Club_%28logo%29.svg/1200px-Paris_Saint-Germain_Football_Club_%28logo%29.svg.png";
  int awayTeamScore = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 25),
              child: Text('20/03/2021', style: TextStyle(fontSize: 16)),
            )
          ],
        ),
        TeamVersusLogos(
            homeTeamLogo, homeTeamScore, awayTeamLogo, awayTeamScore),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 40, 0, 5),
          child: Text('Note players after the game',
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: Colors.green)),
        ),
        Expanded(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
            children: players
                .map((player) => PlayerRatingCard(
                    Player(player.name, player.position, player.averageNote)))
                .toList(),
          ),
        )
      ],
    );
  }
}
