import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/resources/firebase_repository.dart';
import 'package:flutter_app/screens/home_screen.dart';
import 'package:flutter_app/screens/login_screen.dart';
import 'package:flutter_app/screens/search_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  FirebaseRepository _repository = FirebaseRepository();

  @override
  Widget build(BuildContext context) {
//    _repository.signOut();

    return MaterialApp(
      title: "Skype Clone",
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/search_screen': (context) => SearchScreen(),
      },
      home: FutureBuilder(
        future: _repository.getCurrentUser(),
        builder: (BuildContext context, AsyncSnapshot<FirebaseUser> snapshot) {
          if(snapshot.hasData){
            return HomeScreen();
          } else {
            return LoginScreen();
          }
        },
      ),
    );
  }
}
