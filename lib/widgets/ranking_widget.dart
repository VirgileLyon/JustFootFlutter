import 'package:FlutterStyle/models/ranking_model.dart';
import 'package:flutter/material.dart';

class RankingWidget extends StatelessWidget {
  final RankingModel team;

  RankingWidget(this.team);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: double.infinity,
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Card(
            elevation: 1,
            child: Row(
              children: <Widget>[
                SizedBox(width: 10),
                Text(team.rank.toString()),
                SizedBox(width: 20),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Transform(
                    transform: Matrix4.identity()..scale(0.75),
                    child: Image(
                      image: NetworkImage(team.logo, scale: 3.5),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Text(team.teamName, style: TextStyle(fontWeight: FontWeight.bold)),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Transform(
                      transform: Matrix4.identity()..scale(0.75),
                      child: Chip(
                        label: Padding(
                          padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                          child: Text(
                            team.points.toString() + ' pt.',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      )),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
