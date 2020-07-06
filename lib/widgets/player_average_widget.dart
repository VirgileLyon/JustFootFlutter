import 'package:flutter/material.dart';
import 'package:FlutterStyle/models/player_ratings_model.dart';

class PlayerAverage extends StatelessWidget {
  final PlayerNotation playerNotation;
  dynamic color;

  PlayerAverage(this.playerNotation) {
    if (playerNotation.rate < 5) {
      color = Colors.red[400];
    } else if ((playerNotation.rate >= 5) && (playerNotation.rate < 7)) {
      color = Colors.yellow[400];
    } else if (playerNotation.rate >= 7) {
      color = Colors.lightGreen[300];
    }
  }

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
                CircleAvatar(
                  backgroundImage: NetworkImage(playerNotation.imgUrl),
                ),
                SizedBox(width: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      playerNotation.name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      playerNotation.team,
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  children: <Widget>[
                    SizedBox(height: 15),
                    Transform(
                        transform: Matrix4.identity()..scale(0.75),
                        child: Chip(
                          backgroundColor: color,
                          label: Padding(
                            padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                            child: Text(
                              playerNotation.rate.toString(),
                              style: TextStyle(
                                  color: ((playerNotation.rate >= 5) &&
                                          (playerNotation.rate < 7))
                                      ? Colors.black
                                      : Colors.white),
                            ),
                          ),
                        )),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
