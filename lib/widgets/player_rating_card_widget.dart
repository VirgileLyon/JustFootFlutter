import 'package:flutter/material.dart';
import 'package:FlutterStyle/models/player_model.dart';

class PlayerRatingCard extends StatefulWidget {
  final Player player;

  PlayerRatingCard(this.player);

  @override
  _PlayerRatingCardState createState() => _PlayerRatingCardState();
}

class _PlayerRatingCardState extends State<PlayerRatingCard> {
  double rating = 0;

  void ratePlayer(double newRating) {
    setState(() {
      rating = newRating.roundToDouble();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Row(children: <Widget>[
      Padding(
        padding: EdgeInsets.all(10),
        child: CircleAvatar(
          backgroundImage: NetworkImage(
              "https://upload.wikimedia.org/wikipedia/fr/thumb/e/e2/Olympique_lyonnais_%28logo%29.svg/1200px-Olympique_lyonnais_%28logo%29.svg.png"),
        ),
      ),
      SizedBox(width: 10),
      SizedBox(
        width: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              widget.player.name,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              widget.player.position,
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
      SizedBox(
        width: 180,
        child: Slider.adaptive(
          inactiveColor: Colors.green[100],
          activeColor: Colors.green,
          value: rating,
          label: "$rating",
          divisions: 9,
          onChanged: ratePlayer,
          min: 0,
          max: 10,
        ),
      )
    ]));
  }
}
