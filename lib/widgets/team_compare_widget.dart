import 'package:flutter/material.dart';
import 'package:FlutterStyle/widgets/team_compare_stat_widget.dart';

class TeamCompare extends StatefulWidget {
  @override
  _TeamCompareState createState() => _TeamCompareState();
}

class _TeamCompareState extends State<TeamCompare> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: EdgeInsets.symmetric(horizontal: 20),
      crossAxisCount: 2,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(border: Border(right: BorderSide(width: 0.5))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Bordeaux',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TeamStat('Wins', 2),
              TeamStat('Draws', 1),
              TeamStat('Loses', 3),
            ],
          ),
        ),
        Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Lyon',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TeamStat('Wins', 3),
              TeamStat('Draws', 1),
              TeamStat('Loses', 2),
            ],
          ),
        ),
      ],
    );
  }
}
