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
    late User currentUser; // Declare currentUser as late to initialize later

  @override
  void initState() {
    super.initState();
    // Find and set currentUser if it exists in the list
    currentUser = UserData.users.firstWhere(
      (user) => user.username == widget.username,
    );
  } // Declare currentUser as late to initialize later

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
      appBar: null,
      body: Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text('Hello, ${widget.username}'), // Display "Hello, username"
        ),
        Expanded(
          child: ListView(
            children: <Widget>[
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(currentUser.pictureUrl),
                ),
                title: Text('Username: ${currentUser.username }'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Location: ${currentUser.location }'),
                    Text('School: ${currentUser.school }'),
                    Text('Phone Number: ${currentUser.phoneNumber }'),
                    // Add other user details as needed
                  ],
                ),
              ),
              Divider(
                height: 1, // Adjust the height of the divider as needed
                color: Colors.grey, // Set the color of the divider
                thickness: 1, // Set the thickness of the divider
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                child: Text('Logout'),
              ),
            ],
          ),
        ),
      ],
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
