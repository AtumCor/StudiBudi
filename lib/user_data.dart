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
  static final List<User> users = [
    for (int i = 1; i <= 25; i++) 
      User(
        username: 'User$i',
        pictureUrl: i % 2 == 0 
          ? 'https://example.com/default-male.jpg'
          : 'https://example.com/default-female.jpg', // Alternating picture URLs for simplicity
        location: 'City${i % 5}', // Cycle through 5 cities
        school: 'School${(i % 3) + 1}', // Cycle through 3 schools
        classes: ['Class${(i % 4) + 1}', 'Class${((i + 1) % 4) + 1}'], // Each user with 2 classes, cycling through 4 classes
        phoneNumber: '+1234567${(8000 + i).toString().padLeft(4, '0')}', // Generating phone numbers starting from +12345678001
      ),
  ];
}