import 'package:flutter/material.dart';
import 'matching.dart';

class MatchesDisplay extends StatelessWidget {
  final List<User> matchedUsers;

  MatchesDisplay({required this.matchedUsers});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Matches'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Matched Users:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: matchedUsers.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(matchedUsers[index].username),
                    subtitle: Text(matchedUsers[index].location),
                    // Add more user information as needed
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
