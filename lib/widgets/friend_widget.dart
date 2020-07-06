import 'package:flutter/material.dart';
import 'package:FlutterStyle/models/friends_model.dart';
import 'package:FlutterStyle/widgets/player_average_widget.dart';

class FriendWidget extends StatelessWidget {
  final Friend friend;
  const FriendWidget(this.friend);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              friend.name,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.green[300]),
            ),
          ),
          ...friend.playersNotationList.map((playerNotation) {
            return PlayerAverage(playerNotation);
          }).toList()
        ],
      ),
    );
  }
}
