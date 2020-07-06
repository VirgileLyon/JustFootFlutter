import 'package:flutter/material.dart';

class TeamVersusLogos extends StatelessWidget {
  final String homeTeamLogo;
  final int homeTeamScore;
  final String awayTeamLogo;
  final int awayTeamScore;

  TeamVersusLogos(this.homeTeamLogo, this.homeTeamScore, this.awayTeamLogo,
      this.awayTeamScore);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        SizedBox(width: 35),
        Image.network(
          homeTeamLogo,
          scale: 25,
          repeat: ImageRepeat.noRepeat,
        ),
        homeTeamScore != null ? Text(homeTeamScore.toString()) : Text(""),
        Text('-'),
        awayTeamScore != null ? Text(awayTeamScore.toString()) : Text(""),
        Image.network(
          awayTeamLogo,
          scale: 25,
          repeat: ImageRepeat.noRepeat,
        ),
        SizedBox(width: 35),
      ],
    );
  }
}
