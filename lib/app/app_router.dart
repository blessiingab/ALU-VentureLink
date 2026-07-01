import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../features/splash/screens/splash_screen.dart';
import '../features/onboarding/screens/onboarding_screen.dart';
import '../features/authentication/screens/login_screen.dart';
import '../features/authentication/screens/signup_screen.dart';
import '../features/authentication/screens/role_selection_screen.dart';
import '../features/home/screens/home_screen.dart';
import '../features/student/screens/student_dashboard_screen.dart';
import '../features/startup/screens/startup_dashboard_screen.dart';
import '../features/student/screens/browse_startups_screen.dart';
import '../features/auth/providers/auth_provider.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/splash',
    redirect: (BuildContext context, GoRouterState state) {
      final authProvider = context.read<AuthProvider>();
      final isLoggedIn = authProvider.isLoggedIn;
      final isOnboardingComplete = authProvider.isOnboardingComplete;
      final userRole = authProvider.userRole;

      if (state.matchedLocation == '/splash') {
        return null;
      }

      if (!isLoggedIn) {
        return '/login';
      }

      if (!isOnboardingComplete) {
        return '/onboarding';
      }

      if (userRole == null) {
        return '/role-selection';
      }

      return null;
    },
    routes: [
      GoRoute(
        path: '/splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/signup',
        builder: (context, state) => const SignupScreen(),
      ),
      GoRoute(
        path: '/role-selection',
        builder: (context, state) => const RoleSelectionScreen(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/student-dashboard',
        builder: (context, state) => const StudentDashboardScreen(),
      ),
      GoRoute(
        path: '/startup-dashboard',
        builder: (context, state) => const StartupDashboardScreen(),
      ),
      GoRoute(
        path: '/browse-startups',
        builder: (context, state) => const BrowseStartupsScreen(),
      ),
    ],
  );
}
