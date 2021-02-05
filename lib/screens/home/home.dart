import 'package:flutter/material.dart';
import 'package:the_net_ninja_app/models/brew.dart';
import 'package:the_net_ninja_app/screens/home/brew_list.dart';
import 'package:the_net_ninja_app/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:the_net_ninja_app/services/database.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Brew>>.value(
      value: DatabaseService().brews,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text('BrewCrew'),
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          actions: [
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('logout'),
              onPressed: () async {
                await _auth.signOut();
              },
            )
          ],
        ),
        body: BrewList(),
      ),
    );
  }
}
