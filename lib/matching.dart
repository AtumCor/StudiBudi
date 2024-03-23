import 'package:flutter/material.dart';
import 'user_data.dart';

class MatchingScreen extends StatefulWidget {
  @override
  _MatchingScreenState createState() => _MatchingScreenState();
}

class _MatchingScreenState extends State<MatchingScreen> {
  int currentIndex = 0;

  late final List<User> users = UserData.users;

  int _selectedTabIndex = 1; // Assuming MatchingScreen is the middle tab in your BottomNavigationBar

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

  void onTabTapped(int index) {
    setState(() {
      _selectedTabIndex = index;
      // Here you would typically navigate to another page or 
      // change the body content depending on the tab
      // e.g., Navigator.pushReplacement(...) for a different screen
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
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _selectedTabIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Match',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Matches',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}