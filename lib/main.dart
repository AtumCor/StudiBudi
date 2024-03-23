import 'package:flutter/material.dart';
import 'welcome.dart';
import 'login.dart';
import 'registration.dart';
import 'matching.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StudiBudi App',
      initialRoute: '/',
      routes: {
        '/': (context) => WelcomeScreen(),
        '/login': (context) => DestinationScreen(),
        '/registration': (context) => RegistrationScreen(),
        '/matching': (context) => MatchingScreen(matchedUsers: [], currentIndex: 0,),
      },
    );
  }
}
