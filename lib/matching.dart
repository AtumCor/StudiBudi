import 'package:flutter/material.dart';
import 'user_data.dart';
import 'matches.dart';
import 'profile_setting.dart';

class MatchingScreen extends StatefulWidget {
    final List<User> matchedUsers;
    final String username;
    final int currentIndex;

  MatchingScreen({required this.matchedUsers, required this.currentIndex, required this.username});

  @override
  _MatchingScreenState createState() => _MatchingScreenState(matchedUsers: matchedUsers, currentIndex: currentIndex, username: username);
}

class _MatchingScreenState extends State<MatchingScreen> {

    _MatchingScreenState({required this.matchedUsers, required this.currentIndex, required this.username});
  List<User> matchedUsers;
  int currentIndex;
  String username;

  late final List<User> users = UserData.users;

  int _selectedTabIndex = 0; // Assuming MatchingScreen is the middle tab in your BottomNavigationBar

  void declineUser() {
    setState(() {
      if (currentIndex < users.length - 1) {
        currentIndex++;
      }
    });
  }

  void matchUser() {
    setState(() {
      if (currentIndex < users.length) {
        matchedUsers.add(users[currentIndex]);
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
    if (index == 1) {
      // Navigate to MatchesDisplay when "Matches" tab is tapped
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MatchingDisplay(matchedUsers: matchedUsers, currentIndex: currentIndex, username: username,),
        ),
      );
    }else if(index == 2){
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProfilePage(username: username, matchedUsers: matchedUsers, currentIndex: currentIndex),
        ),
      );
    }
    // Handle other tabs if needed
    setState(() {
      _selectedTabIndex = index;
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
                              fit: BoxFit.contain,
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
                                'Username: ${users[currentIndex].name}',
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