import 'package:flutter/material.dart';

class TeamStat extends StatelessWidget {
  final String statLabel;
  final int statValue;

  Color chipColor() {
    if (statLabel == "Wins") {
      return Colors.green[300];
    } else if (statLabel == "Draws") {
      return Colors.grey[300];
    } else if (statLabel == "Loses") {
      return Colors.orange[300];
    }
  }

  TeamStat(this.statLabel, this.statValue);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          width: 50,
          child: Text(statLabel),
        ),
        SizedBox(width: 10),
        Chip(
          label: Text(statValue.toString()),
          backgroundColor: chipColor(),
        )
      ],
    );
  }
}
