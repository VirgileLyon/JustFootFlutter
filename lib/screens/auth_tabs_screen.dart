import 'package:FlutterStyle/screens/home_screen.dart';
import 'package:FlutterStyle/screens/signin_home.dart';
import 'package:FlutterStyle/screens/signup_home.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:FlutterStyle/models/tabs_model.dart';

class AuthTabsScreen extends StatefulWidget {
  @override
  _AuthTabsScreenState createState() => _AuthTabsScreenState();
}

class _AuthTabsScreenState extends State<AuthTabsScreen>
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
        HomeScreen(),
        Icons.home,
      ),
            TabModel(
        'Authentication',
        TabBarView(
          controller: _tabController,
          children: <Widget>[
            SignInHomeScreen(),
            SignUpHomeScreen(),
          ],
        ),
        FontAwesomeIcons.signInAlt,
      ),
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
                    text: 'Sign-in',
                  ),
                  Tab(text: 'Sign-up'),
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
