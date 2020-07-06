import 'package:flutter/material.dart';
import 'package:FlutterStyle/widgets/team_compare_widget.dart';
import 'package:FlutterStyle/widgets/team_versus_logo_widget.dart';

class NextGameTab extends StatelessWidget {
  String homeTeamLogo =
      "https://upload.wikimedia.org/wikipedia/fr/thumb/7/76/Logo_des_Girondins_de_Bordeaux.svg/1200px-Logo_des_Girondins_de_Bordeaux.svg.png";
  int homeTeamScore;
  String awayTeamLogo =
      "https://upload.wikimedia.org/wikipedia/fr/thumb/e/e2/Olympique_lyonnais_%28logo%29.svg/1200px-Olympique_lyonnais_%28logo%29.svg.png";
  int awayTeamScore;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 25),
              child: Text('27/03/2021', style: TextStyle(fontSize: 16)),
            )
          ],
        ),
        TeamVersusLogos(
            homeTeamLogo, homeTeamScore, awayTeamLogo, awayTeamScore),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 30),
          child: Text('Data on their confrontations',
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: Colors.green)),
        ),
        Expanded(child: TeamCompare()),
        Padding(
          padding: EdgeInsets.only(bottom: 50),
          child: Text('Based on 6 last games',
              style: TextStyle(
                  fontSize: 12,
                  fontStyle: FontStyle.italic,
                  color: Colors.grey[600])),
        ),
      ],
    );
  }
}
