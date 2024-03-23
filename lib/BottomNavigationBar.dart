import 'package:flutter/material.dart';

class CustomNavigationBar extends StatefulWidget {
  final Function(int) onSelectedTab;
  final int currentIndex;

  CustomNavigationBar({@required this.onSelectedTab, this.currentIndex});

  @override
  _CustomNavigationBarState createState() => _CustomNavigationBarState(this.currentIndex);
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  int _currentIndex;

  _CustomNavigationBarState(this._currentIndex);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('Home'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.dashboard),
          title: Text('Dashboard'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          title: Text('Profile'),
        )
      ],
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
        widget.onSelectedTab(index);
      },
      selectedItemColor: Theme.of(context).accentColor,
      unselectedItemColor: Colors.grey,
    );
  }
}