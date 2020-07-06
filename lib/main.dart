import 'package:FlutterStyle/providers/ranking_provider.dart';
import 'package:FlutterStyle/providers/teams_provider.dart';
import 'package:FlutterStyle/providers/users_provider.dart';
import 'package:FlutterStyle/screens/auth_tabs_screen.dart';
import 'package:FlutterStyle/screens/team_selection_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/tabs_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UsersProvider>(create: (_) => UsersProvider()),
        ChangeNotifierProvider<RankingProvider>(create: (_) => RankingProvider()),
        ChangeNotifierProvider<TeamsProvider>(create: (_) => TeamsProvider())
      ],
      child: Consumer<UsersProvider>(builder: (_, provider, __) {
        print('main currentUser ${provider.currentUser}');
        return MaterialApp(
            initialRoute: '/',
            theme: ThemeData(primaryColor: Colors.green[300]),
            routes: {
              '/': (_) => (provider.currentUser == null)
                  ? AuthTabsScreen()
                  : TabsScreen(),
              '/team-selection': (_) => TeamSelectionScreen(),
            });
      }),
    );
  }
}
