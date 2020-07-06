import 'package:flutter/material.dart';
import 'package:FlutterStyle/models/coach_model.dart';

class CoachWidget extends StatelessWidget {
  final Coach coach;
  dynamic color;

  CoachWidget(this.coach) {
    if (coach.rate < 5) {
      color = Colors.red[400];
    } else if ((coach.rate >= 5) && (coach.rate < 7)) {
      color = Colors.yellow[400];
    } else if (coach.rate >= 7) {
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
                  backgroundImage: NetworkImage(coach.imgUrl),
                ),
                SizedBox(width: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      coach.name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      coach.team,
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
                              coach.rate.toString(),
                              style: TextStyle(
                                  color: ((coach.rate >= 5) && (coach.rate < 7))
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
