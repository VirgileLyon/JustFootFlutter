import 'package:FlutterStyle/models/player_model.dart';
import 'package:FlutterStyle/models/team_model.dart';
import 'package:FlutterStyle/providers/teams_provider.dart';
import 'package:FlutterStyle/providers/users_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeConnectedScreen extends StatefulWidget {
  @override
  _HomeConnectedScreenState createState() => _HomeConnectedScreenState();
}

class _HomeConnectedScreenState extends State<HomeConnectedScreen> {
  TeamModel myTeam;
  List<Player> playerList;

  @override
  void initState() {
    TeamsProvider teamsProvider =
        Provider.of<TeamsProvider>(context, listen: false);
    UsersProvider userProvider =
        Provider.of<UsersProvider>(context, listen: false);

    // teamsProvider.getMyTeams(userProvider.currentUser.team.apiId);
    teamsProvider.getMyTeams(80);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TeamsProvider provider = Provider.of<TeamsProvider>(context);

    if (provider.myTeam == null) {
      print("myTeam is loading");
    } else {
      myTeam = provider.myTeam;
      playerList = myTeam.players.playerList;
      playerList.sort((a, b) => a.name.compareTo(b.name));
    }

    if (myTeam == null) {
      return Center(child: CircularProgressIndicator());
    } else {
      return Container(
        child: ListView(children: [
          Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(50),
                child: Image(
                  image: NetworkImage(myTeam.logo, scale: 1.5),
                ),
              ),
              Column(
                children: <Widget>[
                  ...playerList.map((e) =>
                      PlayerHomeWidget(e.name, e.position, myTeam.logo, 0))
                ],
              )
            ],
          ),
        ]),
      );
    }
  }
}

class PlayerHomeWidget extends StatelessWidget {
  final String name;
  final String position;
  final String logo;
  double rate;
  dynamic color;

  PlayerHomeWidget(this.name, this.position, this.logo, this.rate) {
    if (rate < 5) {
      color = Colors.red[400];
    } else if ((rate >= 5) && (rate < 7)) {
      color = Colors.yellow[400];
    } else if (rate >= 7) {
      color = Colors.lightGreen[300];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Card(
        child: Row(children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Image(
              image: NetworkImage(logo, scale: 3.5),
            ),
          ),
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Text(
                    name,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(position),
              ]),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Transform(
                transform: Matrix4.identity()..scale(0.75),
                child: Chip(
                  backgroundColor: color,
                  label: Padding(
                    padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                    child: Text(
                      rate.toString(),
                      style: TextStyle(
                          color: ((rate >= 5) && (rate < 7))
                              ? Colors.black
                              : Colors.white),
                    ),
                  ),
                )),
          )
        ]),
      ),
    );
  }
}
