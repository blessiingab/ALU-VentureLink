import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../features/auth/providers/auth_provider.dart';
import '../features/auth/screens/splash_screen.dart';
import '../features/auth/screens/login_screen.dart';
import '../features/auth/screens/signup_screen.dart';
import '../features/onboarding/screens/onboarding_screen.dart';
import '../features/onboarding/screens/role_selection_screen.dart';
import '../features/dashboard/screens/student_dashboard_screen.dart';
import '../features/dashboard/screens/startup_dashboard_screen.dart';
import '../features/dashboard/screens/investor_dashboard_screen.dart';
import '../features/startup/screens/startup_list_screen.dart';
import '../features/startup/screens/startup_detail_screen.dart';
import '../features/student/screens/opportunities_screen.dart';
import '../features/student/screens/opportunity_detail_screen.dart';
import '../features/student/screens/applications_screen.dart';
import '../features/profile/screens/profile_screen.dart';
import '../features/profile/screens/edit_profile_screen.dart';
import '../features/chat/screens/chat_list_screen.dart';
import '../features/chat/screens/chat_detail_screen.dart';
import '../features/notifications/screens/notifications_screen.dart';
import '../features/settings/screens/settings_screen.dart';

class AppRoutes {
  static final GoRouter router = GoRouter(
    initialLocation: '/splash',
    redirect: (BuildContext context, GoRouterState state) {
      final authProvider = context.read<AuthProvider>();
      final isLoggedIn = authProvider.isLoggedIn;
      final userRole = authProvider.userRole;

      if (state.matchedLocation == '/splash') return null;
      if (!isLoggedIn && state.matchedLocation != '/login' && state.matchedLocation != '/signup') {
        return '/login';
      }
      return null;
    },
    routes: [
      GoRoute(
        path: '/splash',
        builder: (context, state) => const SplashScreen(),
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
        path: '/onboarding',
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: '/role-selection',
        builder: (context, state) => const RoleSelectionScreen(),
      ),
      GoRoute(
        path: '/student-dashboard',
        builder: (context, state) => const StudentDashboardScreen(),
        routes: [
          GoRoute(
            path: 'opportunities',
            builder: (context, state) => const OpportunitiesScreen(),
            routes: [
              GoRoute(
                path: ':id',
                builder: (context, state) => OpportunityDetailScreen(
                  opportunityId: state.pathParameters['id']!,
                ),
              ),
            ],
          ),
          GoRoute(
            path: 'applications',
            builder: (context, state) => const ApplicationsScreen(),
          ),
        ],
      ),
      GoRoute(
        path: '/startup-dashboard',
        builder: (context, state) => const StartupDashboardScreen(),
      ),
      GoRoute(
        path: '/investor-dashboard',
        builder: (context, state) => const InvestorDashboardScreen(),
      ),
      GoRoute(
        path: '/startups',
        builder: (context, state) => const StartupListScreen(),
        routes: [
          GoRoute(
            path: ':id',
            builder: (context, state) => StartupDetailScreen(
              startupId: state.pathParameters['id']!,
            ),
          ),
        ],
      ),
      GoRoute(
        path: '/profile',
        builder: (context, state) => const ProfileScreen(),
        routes: [
          GoRoute(
            path: 'edit',
            builder: (context, state) => const EditProfileScreen(),
          ),
        ],
      ),
      GoRoute(
        path: '/chat',
        builder: (context, state) => const ChatListScreen(),
        routes: [
          GoRoute(
            path: ':userId',
            builder: (context, state) => ChatDetailScreen(
              userId: state.pathParameters['userId']!,
            ),
          ),
        ],
      ),
      GoRoute(
        path: '/notifications',
        builder: (context, state) => const NotificationsScreen(),
      ),
      GoRoute(
        path: '/settings',
        builder: (context, state) => const SettingsScreen(),
      ),
    ],
  );
}
