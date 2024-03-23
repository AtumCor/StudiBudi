import 'package:flutter/material.dart';
import 'user_data.dart';
import 'matching.dart';
import 'matches.dart';

class ProfilePage extends StatefulWidget {
  final String username;
  final List<User> matchedUsers;
  final int currentIndex;

  ProfilePage({
    required this.username,
    required this.matchedUsers,
    required this.currentIndex,
  });

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _selectedTabIndex = 2; // Initialize with the index of 'Profile' tab

  void onTabTapped(int index) {
    if (index == 0) {
      // Navigate to MatchingScreen when "Match" tab is tapped
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MatchingScreen(
            matchedUsers: widget.matchedUsers,
            currentIndex: widget.currentIndex,
            username: widget.username,
          ),
        ),
      );
    } else if (index == 1) {
      // Navigate to MatchingDisplay when "Matches" tab is tapped
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MatchingDisplay(
            matchedUsers: widget.matchedUsers,
            currentIndex: widget.currentIndex,
            username: widget.username,
          ),
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
    // Use the properties from widget in your widget build method
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Username: ${widget.username}'),
            // Add other user details here based on your User class
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              child: Text('Logout'),
            ),
          ],
        ),
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
