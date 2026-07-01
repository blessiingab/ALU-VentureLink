import 'package:flutter/material.dart';
import 'dart:ui';

class AppColors {
  // Modern Gradient System
  static const Color primary = Color(0xFF5B4AFF); // Deep Purple
  static const Color primaryLight = Color(0xFF8B7FFF);
  static const Color primaryDark = Color(0xFF3D2FFF);
  
  static const Color secondary = Color(0xFF00D9FF); // Cyber Cyan
  static const Color secondaryLight = Color(0xFF4FE9FF);
  static const Color secondaryDark = Color(0xFF00A8CC);
  
  static const Color accent = Color(0xFFFF006E); // Hot Pink
  static const Color accentLight = Color(0xFFFF4DA8);
  static const Color accentDark = Color(0xFFCC0055);
  
  static const Color success = Color(0xFF00D084);
  static const Color warning = Color(0xFFFFA500);
  static const Color error = Color(0xFFFF3860);
  static const Color info = Color(0xFF3273DC);

  // Neutral Scale
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF0A0E27);
  static const Color grey50 = Color(0xFFF8F9FF);
  static const Color grey100 = Color(0xFFF0F1FF);
  static const Color grey200 = Color(0xFFE8EBFF);
  static const Color grey300 = Color(0xFFDDE1FF);
  static const Color grey400 = Color(0xFFC4CCF0);
  static const Color grey500 = Color(0xFF9BA3C1);
  static const Color grey600 = Color(0xFF6B7190);
  static const Color grey700 = Color(0xFF3F4760);
  static const Color grey800 = Color(0xFF1F2540);
  static const Color grey900 = Color(0xFF0A0E27);

  // Gradients
  static const LinearGradient purpleGradient = LinearGradient(
    colors: [Color(0xFF5B4AFF), Color(0xFF8B7FFF)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient cyanGradient = LinearGradient(
    colors: [Color(0xFF00D9FF), Color(0xFF4FE9FF)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient pinkGradient = LinearGradient(
    colors: [Color(0xFFFF006E), Color(0xFFFF4DA8)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient darkGradient = LinearGradient(
    colors: [Color(0xFF0A0E27), Color(0xFF1F2540)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
