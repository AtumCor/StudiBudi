import 'package:flutter/material.dart';

class MatchingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Matching Screen'),
      ),
      body: Center(
        child: Text(
          'Welcome to Matching Screen!',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
