import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_net_ninja_app/models/user.dart';
import 'package:the_net_ninja_app/screens/authenticate/authenticate.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:the_net_ninja_app/screens/home/home.dart';

class Wrapper extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<CustomUser>(context);
    print(user);

    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        // return either Home or Authenticate widget
        return Authenticate();
      },
    );
  }
}
