import 'package:flutter/material.dart';
import 'user_data.dart';
import 'messageInterface.dart';
import 'matching.dart';
import 'profile_setting.dart';
import 'package:your_package/profile_page.dart';

class MatchingDisplay extends StatefulWidget {
  final List<User> matchedUsers;
  final String username;
  final int currentIndex;
  MatchingDisplay({required this.matchedUsers, required this.currentIndex, required this.username});

  @override
  _MatchingDisplayState createState() => _MatchingDisplayState(matchedUsers: matchedUsers, currentIndex: currentIndex, username: username);
}

class _MatchingDisplayState extends State<MatchingDisplay> {
  final List<User> matchedUsers;
  final String username;
  final int currentIndex;
  int _selectedTabIndex = 1;

  _MatchingDisplayState({required this.matchedUsers, required this.currentIndex, required this.username});


  void onTabTapped(int index) {
    if (index == 0) {
      // Navigate to MatchesDisplay when "Matches" tab is tapped
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MatchingScreen(matchedUsers: matchedUsers, currentIndex: currentIndex, username: username,),
        ),   
      );
    }else if(index == 2){
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProfilePage(username: matchedUsers[currentIndex].username, password: matchedUsers[currentIndex].password, location: matchedUsers[currentIndex].location, school: matchedUsers[currentIndex].school, phoneNumber: matchedUsers[currentIndex].phoneNumber),
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
      appBar: null,
      body: matchedUsers.length > 0 ? ListView.builder( 
  itemCount: matchedUsers.length,
  itemBuilder: (context, index) {
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            radius: 20, // Adjust the radius as needed
            backgroundImage: NetworkImage(matchedUsers[index].pictureUrl), // Use the actual URL of the user's profile image
          ),
          title: Text(matchedUsers[index].username),
          onTap: () {
            // Navigate to user profile screen when tapped
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => UserProfileScreen(user: matchedUsers[index]),
              ),
            );
          },
        ),
        Divider(
          height: 1, // Adjust the height of the divider as needed
          color: Colors.grey, // Set the color of the divider
          thickness: 1, // Set the thickness of the divider
        ),
      ],
    );
  },
)
 : 
        Text('Currently no matches have been chosen.'),
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

