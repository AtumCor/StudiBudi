import 'package:flutter/material.dart';
import 'matching.dart';

class RegistrationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration'),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                Text(
                'Registration Page',
                style: TextStyle(fontSize: 24.0),
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                onPressed: () {
                    Navigator.pushNamed(context, '/matching');
                },
                child: Text('Submit'),
                )
            ]
        ) 
      ),
    );
  }
}
