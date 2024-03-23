import 'package:flutter/material.dart';

class User {
  final String username;
  final String pictureUrl;
  final String location;
  final String school;
  final List<String> classes;
  final String phoneNumber; // New field for phone number

  User({
    required this.username,
    required this.pictureUrl,
    required this.location,
    required this.school,
    required this.classes,
    required this.phoneNumber, // Update constructor
  });
}

class UserData {
  static final List<String> cityStates = [
    'New York, NY',
    'Los Angeles, CA',
    'Chicago, IL',
    'Houston, TX',
    'Phoenix, AZ',
    'Philadelphia, PA',
    'San Antonio, TX',
    'San Diego, CA',
    'Dallas, TX',
    'San Jose, CA',
  ];

  static final List<String> schools = [
    'Stuyvesant High School',
    'Bronx High School of Science',
    'Brooklyn Technical High School',
    'Phillips Academy',
    'Thomas Jefferson High School for Science and Technology',
    'Illinois Mathematics and Science Academy',
    'The Harker School',
    'The College Preparatory School',
    'Maggie L. Walker Governor’s School',
    'Basis Scottsdale',
  ];

  static final List<String> classes = [
    'Biology',
    'Physics',
    'Chemistry',
    'Mathematics',
    'English Literature',
    'World History',
    'Computer Science',
    'Art',
    'Physical Education',
    'Economics',
  ];

  static final List<User> users = [
    for (int i = 1; i <= 25; i++) 
      User(
        username: 'User$i',
        pictureUrl: i % 2 == 0 
          ? 'https://example.com/default-male.jpg'
          : 'https://example.com/default-female.jpg',
        location: cityStates[i % cityStates.length],
        school: schools[i % schools.length],
        classes: [classes[i % classes.length], classes[(i * 2) % classes.length]], // Ensure variety
        phoneNumber: '+1234567${(8000 + i).toString().padLeft(4, '0')}',
      ),
  ];
}