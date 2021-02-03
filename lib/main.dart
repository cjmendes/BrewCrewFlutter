import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_net_ninja_app/models/user.dart';
import 'package:the_net_ninja_app/screens/wrapper.dart';
import 'package:the_net_ninja_app/services/auth.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<CustomUser>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
