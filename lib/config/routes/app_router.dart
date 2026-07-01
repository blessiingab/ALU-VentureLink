import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../features/auth/screens/splash_screen.dart';
import '../../features/auth/screens/login_screen.dart';
import '../../features/auth/screens/signup_screen.dart';
import '../../features/auth/screens/onboarding_screen.dart';
import '../../features/auth/screens/role_selection_screen.dart';
import '../../features/home/screens/home_screen.dart';
import '../../features/opportunities/screens/opportunities_list_screen.dart';
import '../../features/opportunities/screens/opportunity_detail_screen.dart';
import '../../features/applications/screens/apply_screen.dart';
import '../../features/applications/screens/my_applications_screen.dart';
import '../../features/startup/screens/startup_dashboard_screen.dart';
import '../../features/startup/screens/create_opportunity_screen.dart';
import '../../features/startup/screens/manage_opportunities_screen.dart';
import '../../features/profile/screens/profile_screen.dart';
import '../../features/profile/screens/edit_profile_screen.dart';
import '../../features/bookmarks/screens/bookmarks_screen.dart';
import '../../features/auth/providers/auth_provider.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/splash',
    redirect: (BuildContext context, GoRouterState state) {
      final authProvider = context.read<AuthProvider>();
      final isLoggedIn = authProvider.isLoggedIn;
      final isOnboardingComplete = authProvider.isOnboardingComplete;

      if (state.matchedLocation == '/splash') {
        return null;
      }

      if (!isLoggedIn) {
        return '/login';
      }

      if (!isOnboardingComplete) {
        return '/onboarding';
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
        path: '/role-selection',
        builder: (context, state) => const RoleSelectionScreen(),
      ),
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomeScreen(),
        routes: [
          GoRoute(
            path: 'opportunities',
            builder: (context, state) => const OpportunitiesListScreen(),
            routes: [
              GoRoute(
                path: ':opportunityId',
                builder: (context, state) => OpportunityDetailScreen(
                  opportunityId: state.pathParameters['opportunityId']!,
                ),
              ),
            ],
          ),
          GoRoute(
            path: 'apply/:opportunityId',
            builder: (context, state) => ApplyScreen(
              opportunityId: state.pathParameters['opportunityId']!,
            ),
          ),
          GoRoute(
            path: 'applications',
            builder: (context, state) => const MyApplicationsScreen(),
          ),
          GoRoute(
            path: 'bookmarks',
            builder: (context, state) => const BookmarksScreen(),
          ),
          GoRoute(
            path: 'profile',
            builder: (context, state) => const ProfileScreen(),
            routes: [
              GoRoute(
                path: 'edit',
                builder: (context, state) => const EditProfileScreen(),
              ),
            ],
          ),
          GoRoute(
            path: 'startup-dashboard',
            builder: (context, state) => const StartupDashboardScreen(),
            routes: [
              GoRoute(
                path: 'create-opportunity',
                builder: (context, state) => const CreateOpportunityScreen(),
              ),
              GoRoute(
                path: 'manage-opportunities',
                builder: (context, state) => const ManageOpportunitiesScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
