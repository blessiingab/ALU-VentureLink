import 'package:flutter/material.dart';
import '../features/auth/login_screen.dart';
import '../features/onboarding/onboarding_screen.dart';
import '../features/student/student_dashboard.dart';

class AppRoutes {
  AppRoutes._();

  static const onboarding = '/';
  static const login = '/login';
  static const dashboard = '/dashboard';

  static final routes = <String, WidgetBuilder>{
    onboarding: (_) => const OnboardingScreen(),
    login: (_) => const LoginScreen(),
    dashboard: (_) => const StudentDashboard(),
  };
}
