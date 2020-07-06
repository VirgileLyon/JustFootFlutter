import 'package:FlutterStyle/screens/home_connected_screen.dart';
import 'package:FlutterStyle/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:FlutterStyle/models/tabs_model.dart';
import 'package:FlutterStyle/screens/games_current_screen.dart';
import 'package:FlutterStyle/screens/games_next_screen.dart';
import 'community_screen.dart';
import 'friends_screen.dart';


class TabsScreen extends StatefulWidget {
  static const String screenRoute = '/';

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  TabController _tabController;
  List<TabModel> _tabs;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);

    _tabs = [
      TabModel(
        'Home',
        HomeConnectedScreen(),
        Icons.home,
      ),
      TabModel(
        'Games',
        TabBarView(
          controller: _tabController,
          children: <Widget>[
            GamesCurrentTab(),
            NextGameTab(),
          ],
        ),
        FontAwesomeIcons.solidFutbol,
      ),
      TabModel(
        'Community',
        CommunityScreen(),
        FontAwesomeIcons.comment,
      ),
      TabModel(
        'Friends',
        FriendsScreen(),
        FontAwesomeIcons.userFriends,
      ),
      TabModel(
        'Account',
        ProfileScreen(),
        Icons.person,
      )
    ];

    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(_tabs[_currentIndex].title,
            style: TextStyle(color: Colors.white)),
        bottom: _tabs[_currentIndex].widget is TabBarView
            ? TabBar(
                controller: _tabController,
                indicatorColor: Colors.green[900],
                labelColor: Colors.black87,
                tabs: [
                  Tab(
                    text: 'GAME TO NOTE',
                  ),
                  Tab(text: 'NEXT GAME'),
                ],
              )
            : null,
      ),
      body: _tabs[_currentIndex].widget,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.grey[200],
        onTap: (currentindex) {
          setState(() {
            _currentIndex = currentindex;
          });
        },
        items: _tabs
            .map(
              (tab) => BottomNavigationBarItem(
                icon: Icon(tab.icon),
                title: Text(tab.title),
                backgroundColor: Colors.white,
              ),
            )
            .toList(),
      ),
    );
  }
}
