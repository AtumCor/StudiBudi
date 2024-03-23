import 'package:flutter/material.dart';

class User {
  final String username;
  final String pictureUrl;
  final String location;
  final String school;
  final List<String> classes;

  User({
    required this.username,
    required this.pictureUrl,
    required this.location,
    required this.school,
    required this.classes,
  });
}

class MatchingScreen extends StatefulWidget {
  @override
  _MatchingScreenState createState() => _MatchingScreenState();
}

class _MatchingScreenState extends State<MatchingScreen> {
  int currentIndex = 0;

  final List<User> users = [
    User(
      username: 'User1',
      pictureUrl: './lib/img/image.png',
      location: 'City1',
      school: 'School1',
      classes: ['Math', 'Science'],
    ),
    User(
      username: 'User2',
      pictureUrl: 'https://example.com/user2.jpg',
      location: 'City2',
      school: 'School2',
      classes: ['History', 'English'],
    ),
    // Add more users as needed
  ];

  void declineUser() {
    setState(() {
      if (currentIndex < users.length - 1) {
        currentIndex++;
      }
    });
  }

  void matchUser() {
    setState(() {
      if (currentIndex < users.length - 1) {
        currentIndex++;
      } else {
        // All users traversed, show message
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('All potential users have been seen.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context); // Close dialog
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null, // Remove the app bar (header)
      body: currentIndex < users.length
          ? LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      flex: 7,
                      child: Card(
                        elevation: 4,
                        child: AspectRatio(
                          aspectRatio: 16 / 9,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              users[currentIndex].pictureUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Card(
                        elevation: 4,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Username: ${users[currentIndex].username}',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 8),
                              Text('Location: ${users[currentIndex].location}'),
                              Text('School: ${users[currentIndex].school}'),
                              Text('Classes: ${users[currentIndex].classes.join(', ')}'),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          onPressed: declineUser,
                          child: Text('Decline'),
                        ),
                        ElevatedButton(
                          onPressed: matchUser,
                          child: Text('Match'),
                        ),
                      ],
                    ),
                  ],
                );
              },
            )
          : Center(
              child: Text('All potential users have been seen.'),
            ),
    );
  }

}
