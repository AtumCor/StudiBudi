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
    User(
      username: 'User1',
      pictureUrl: 'https://via.placeholder.com/150',
      location: 'New York, NY',
      school: 'Stuyvesant High School',
      classes: ['Biology', 'Mathematics'],
      phoneNumber: '+12345678001',
    ),
    User(
      username: 'User2',
      pictureUrl: 'https://via.placeholder.com/150',
      location: 'Los Angeles, CA',
      school: 'The Harker School',
      classes: ['Physics', 'English Literature'],
      phoneNumber: '+12345678002',
    ),
    User(
      username: 'User3',
      pictureUrl: 'https://via.placeholder.com/150',
      location: 'Chicago, IL',
      school: 'Brooklyn Technical High School',
      classes: ['Chemistry', 'World History'],
      phoneNumber: '+12345678003',
    ),
    User(
      username: 'User4',
      pictureUrl: 'https://via.placeholder.com/150',
      location: 'Houston, TX',
      school: 'Phillips Academy',
      classes: ['Computer Science', 'Art'],
      phoneNumber: '+12345678004',
    ),
    User(
      username: 'User5',
      pictureUrl: 'https://via.placeholder.com/150',
      location: 'Phoenix, AZ',
      school: 'Thomas Jefferson High School for Science and Technology',
      classes: ['Economics', 'Physical Education'],
      phoneNumber: '+12345678005',
    ),
    User(
      username: 'User6',
      pictureUrl: 'https://via.placeholder.com/150',
      location: 'Philadelphia, PA',
      school: 'Illinois Mathematics and Science Academy',
      classes: ['Biology', 'Mathematics'],
      phoneNumber: '+12345678006',
    ),
    User(
      username: 'User7',
      pictureUrl: 'https://via.placeholder.com/150',
      location: 'San Antonio, TX',
      school: 'The College Preparatory School',
      classes: ['Physics', 'English Literature'],
      phoneNumber: '+12345678007',
    ),
        User(
      username: 'User8',
      pictureUrl: 'https://via.placeholder.com/150',
      location: 'San Diego, CA',
      school: 'Maggie L. Walker Governor’s School',
      classes: ['Chemistry', 'World History'],
      phoneNumber: '+12345678008',
    ),
    User(
      username: 'User9',
      pictureUrl: 'https://via.placeholder.com/150',
      location: 'Dallas, TX',
      school: 'Basis Scottsdale',
      classes: ['Biology', 'Art'],
      phoneNumber: '+12345678009',
    ),
    User(
      username: 'User10',
      pictureUrl: 'https://via.placeholder.com/150',
      location: 'San Jose, CA',
      school: 'Stuyvesant High School',
      classes: ['Economics', 'Physical Education'],
      phoneNumber: '+12345678010',
    ),
    User(
      username: 'User11',
      pictureUrl: 'https://via.placeholder.com/150',
      location: 'Austin, TX',
      school: 'The Harker School',
      classes: ['Mathematics', 'Computer Science'],
      phoneNumber: '+12345678011',
    ),
    User(
      username: 'User12',
      pictureUrl: 'https://via.placeholder.com/150',
      location: 'Jacksonville, FL',
      school: 'Brooklyn Technical High School',
      classes: ['English Literature', 'Physics'],
      phoneNumber: '+12345678012',
    ),
    User(
      username: 'User13',
      pictureUrl: 'https://via.placeholder.com/150',
      location: 'San Francisco, CA',
      school: 'Phillips Academy',
      classes: ['World History', 'Chemistry'],
      phoneNumber: '+12345678013',
    ),
    User(
      username: 'User14',
      pictureUrl: 'https://via.placeholder.com/150',
      location: 'Columbus, OH',
      school: 'Thomas Jefferson High School for Science and Technology',
      classes: ['Art', 'Biology'],
      phoneNumber: '+12345678014',
    ),
    User(
      username: 'User15',
      pictureUrl: 'https://via.placeholder.com/150',
      location: 'Fort Worth, TX',
      school: 'Illinois Mathematics and Science Academy',
      classes: ['Physical Education', 'Economics'],
      phoneNumber: '+12345678015',
    ),
    User(
      username: 'User16',
      pictureUrl: 'https://via.placeholder.com/150',
      location: 'Charlotte, NC',
      school: 'The College Preparatory School',
      classes: ['Mathematics', 'Computer Science'],
      phoneNumber: '+12345678016',
    ),
    User(
      username: 'User17',
      pictureUrl: 'https://via.placeholder.com/150',
      location: 'Detroit, MI',
      school: 'Maggie L. Walker Governor’s School',
      classes: ['English Literature', 'Physics'],
      phoneNumber: '+12345678017',
    ),
    User(
      username: 'User18',
      pictureUrl: 'https://via.placeholder.com/150',
      location: 'El Paso, TX',
      school: 'Basis Scottsdale',
      classes: ['World History', 'Chemistry'],
      phoneNumber: '+12345678018',
    ),
    User(
      username: 'User19',
      pictureUrl: 'https://via.placeholder.com/150',
      location: 'Denver, CO',
      school: 'Stuyvesant High School',
      classes: ['Art', 'Biology'],
      phoneNumber: '+12345678019',
    ),
    User(
      username: 'User20',
      pictureUrl: 'https://via.placeholder.com/150',
      location: 'Seattle, WA',
      school: 'The Harker School',
      classes: ['Physical Education', 'Economics'],
      phoneNumber: '+12345678020',
    ),
    User(
      username: 'User21',
      pictureUrl: 'https://via.placeholder.com/150',
      location: 'Nashville, TN',
      school: 'Brooklyn Technical High School',
      classes: ['Mathematics', 'Computer Science'],
      phoneNumber: '+12345678021',
    ),
    User(
      username: 'User22',
      pictureUrl: 'https://via.placeholder.com/150',
      location: 'Memphis, TN',
      school: 'Phillips Academy',
      classes: ['English Literature', 'Physics'],
      phoneNumber: '+12345678022',
    ),
    User(
      username: 'User23',
      pictureUrl: 'https://via.placeholder.com/150',
      location: 'Boston, MA',
      school: 'Thomas Jefferson High School for Science and Technology',
      classes: ['World History', 'Chemistry'],
      phoneNumber: '+12345678023',
    ),
    User(
      username: 'User24',
      pictureUrl: 'https://via.placeholder.com/150',
      location: 'Baltimore, MD',
      school: 'Illinois Mathematics and Science Academy',
      classes: ['Art', 'Biology'],
      phoneNumber: '+12345678024',
    ),
    User(
      username: 'User25',
      pictureUrl: 'https://via.placeholder.com/150',
      location: 'Albuquerque, NM',
      school: 'The College Preparatory School',
      classes: ['Physical Education', 'Economics'],
      phoneNumber: '+12345678025',
    ),
  ];
}