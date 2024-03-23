import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String username;
  final String password;
  final String location;
  final String school;
  final String phoneNumber;

ProfilePage({required this.username, required this.password, required this.location, required this.school, required this.phoneNumber});

@override
Widget build(BuildContext context) {
  // Use the properties in your widget build method
  return Scaffold(
    appBar: AppBar(
      title: Text("Profile Page"),
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
        Text('Username: $username'),
        Text('Password: $password'),
        Text('Location: $location'),
        Text('School: $school'),
          Text('Phone Number: $phoneNumber'),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/login');
            },
            child: Text('Logout'),
          ),
        ],
      ),
    ),
    );
  }
}