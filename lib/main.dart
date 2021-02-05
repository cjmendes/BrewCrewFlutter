import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_net_ninja_app/models/user.dart';
import 'package:the_net_ninja_app/screens/wrapper.dart';
import 'package:the_net_ninja_app/services/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:the_net_ninja_app/shared/loading.dart';

//void main() => runApp(MyApp());
void main() async {
  //WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  runApp(MyApp());
}

// class MyApp extends StatelessWidget {
//   //final Future<FirebaseApp> _initialization = Firebase.initializeApp();

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return StreamProvider<CustomUser>.value(
//       value: AuthService().user,
//       child: MaterialApp(
//         home: Wrapper(),
//       ),
//     );
//   }
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        // Check for errors
        // if (snapshot.hasError) {
        //   return SomethingWentWrong();
        // }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return StreamProvider<CustomUser>.value(
            value: AuthService().user,
            child: MaterialApp(
              home: Wrapper(),
            ),
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Loading(),
        );
      },
    );
  }
}
