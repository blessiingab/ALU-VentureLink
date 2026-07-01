import 'package:flutter/material.dart';

class User {
  final String id;
  final String name;
  final String email;
  final String? profileImage;
  final String? bio;
  final String userType; // 'student', 'startup', 'investor', 'mentor'
  final List<String> skills;
  final String? university;
  final String? course;
  final DateTime createdAt;

  User({
    required this.id,
    required this.name,
    required this.email,
    this.profileImage,
    this.bio,
    required this.userType,
    this.skills = const [],
    this.university,
    this.course,
    required this.createdAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      profileImage: json['profileImage'],
      bio: json['bio'],
      userType: json['userType'],
      skills: List<String>.from(json['skills'] ?? []),
      university: json['university'],
      course: json['course'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'profileImage': profileImage,
      'bio': bio,
      'userType': userType,
      'skills': skills,
      'university': university,
      'course': course,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
