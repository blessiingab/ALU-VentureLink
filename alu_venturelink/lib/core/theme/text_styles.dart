import 'package:flutter/material.dart';

class AppTextStyles {
  AppTextStyles._();

  static const TextStyle headline = TextStyle(
    color: Colors.white,
    fontSize: 34,
    fontWeight: FontWeight.w800,
    height: 1.1,
  );

  static const TextStyle subtitle = TextStyle(
    color: Color(0xFF9BB1E0),
    fontSize: 16,
    height: 1.6,
  );

  static const TextStyle sectionTitle = TextStyle(
    color: Colors.white,
    fontSize: 20,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle cardTitle = TextStyle(
    color: Colors.white,
    fontSize: 18,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle cardSubtitle = TextStyle(
    color: Color(0xFF8EABD6),
    fontSize: 14,
  );

  static const TextStyle button = TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.w700,
  );

  static final TextTheme textTheme = TextTheme(
    displayLarge: headline,
    titleLarge: sectionTitle,
    titleMedium: cardTitle,
    bodyMedium: subtitle,
    bodySmall: const TextStyle(color: Color(0xFFB8C8F0), fontSize: 14),
  );
}
