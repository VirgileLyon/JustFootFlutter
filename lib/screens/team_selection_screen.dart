import 'package:FlutterStyle/models/team_model.dart';
import 'package:FlutterStyle/providers/teams_provider.dart';
import 'package:FlutterStyle/providers/users_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TeamSelectionScreen extends StatefulWidget {
  static const String screenRoute = '/team_selection';
  @override
  _TeamSelectionState createState() => _TeamSelectionState();
}

class _TeamSelectionState extends State<TeamSelectionScreen> {
  List<TeamModel> teams;

  @override
  void initState() {
    TeamsProvider provider = Provider.of<TeamsProvider>(context, listen: false);
    provider.getTeams();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TeamsProvider teamProvider = Provider.of<TeamsProvider>(context);

    if (teamProvider.allTeams == null) {
      print("allTeams is loading");
    } else {
      teams = teamProvider.allTeams.teamList;
      teams.sort((a, b) => a.name.compareTo(b.name));
    }

    if (teams == null) {
      return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title:
                Text('Select Your Team', style: TextStyle(color: Colors.white)),
          ),
          body: Center(child: CircularProgressIndicator()));
    } else {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title:
              Text('Select Your Team', style: TextStyle(color: Colors.white)),
        ),
        body: Column(
          children: <Widget>[
            Flexible(
              child: ListView(
                  children: teams.map((team) {
                return TeamSelection(team);
              }).toList()),
            ),
          ],
        ),
      );
    }
  }
}

class TeamSelection extends StatelessWidget {
  TeamModel team;

  TeamSelection(this.team);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Column(children: <Widget>[
          RowWithTeams(team),
        ]),
      ),
    );
  }
}

class RowWithTeams extends StatefulWidget {
  TeamModel team;

  RowWithTeams(this.team);

  @override
  _RowWithTeamsState createState() => _RowWithTeamsState();
}

class _RowWithTeamsState extends State<RowWithTeams> {
  bool checkBoxValue = false;
  @override
  Widget build(BuildContext context) {
    void _showDialog(value) {
      // flutter defined function
      showDialog(
        context: context,
        builder: (BuildContext subContext) {
          // return object of type Dialog
          return AlertDialog(
            title: new Text("Confirm and continue?"),
            content: new Text("Do you want to support  « $value » team?"),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              FlatButton(
                child: new Text("Cancel"),
                onPressed: () {
                  Navigator.of(subContext).pop();
                },
              ),
              FlatButton(
                child: new Text("Continue"),
                onPressed: () {
                  Provider.of<UsersProvider>(context, listen: false)
                      .currentUser
                      .team = widget.team;
                  Navigator.of(context).pushReplacementNamed('/');
                },
              )
            ],
          );
        },
      );
    }

    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.black12,
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          Image(
            image: NetworkImage(widget.team.logo, scale: 4),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(widget.team.name),
              Text(
                widget.team.stadium,
                style: TextStyle(
                    fontStyle: FontStyle.italic, color: Colors.green[300]),
              )
            ],
          ),
          Spacer(),
          SizedBox(
            width: 10,
          ),
          Checkbox(
            activeColor: Colors.green,
            materialTapTargetSize: MaterialTapTargetSize.padded,
            value: checkBoxValue,
            onChanged: (bool value) {
              _showDialog(widget.team.name);
            },
          )
        ],
      ),
    );
  }
}
