import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  bool _isLoggedIn = false;
  bool _isOnboardingComplete = false;
  String? _userRole; // 'student', 'startup', 'investor', 'mentor'
  String? _userId;
  String? _userName;
  String? _userEmail;
  String? _userProfileImage;

  // Getters
  bool get isLoggedIn => _isLoggedIn;
  bool get isOnboardingComplete => _isOnboardingComplete;
  String? get userRole => _userRole;
  String? get userId => _userId;
  String? get userName => _userName;
  String? get userEmail => _userEmail;
  String? get userProfileImage => _userProfileImage;
  bool get isStudent => _userRole == 'student';
  bool get isStartup => _userRole == 'startup';
  bool get isInvestor => _userRole == 'investor';
  bool get isMentor => _userRole == 'mentor';

  // Login
  Future<bool> login(String email, String password) async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      _isLoggedIn = true;
      _userId = 'user_${DateTime.now().millisecondsSinceEpoch}';
      _userEmail = email;
      _userName = email.split('@').first;
      notifyListeners();
      return true;
    } catch (e) {
      return false;
    }
  }

  // Sign up
  Future<bool> signup(String name, String email, String password) async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      _isLoggedIn = true;
      _userId = 'user_${DateTime.now().millisecondsSinceEpoch}';
      _userEmail = email;
      _userName = name;
      notifyListeners();
      return true;
    } catch (e) {
      return false;
    }
  }

  // Set role
  void setRole(String role) {
    _userRole = role;
    notifyListeners();
  }

  // Complete onboarding
  void completeOnboarding() {
    _isOnboardingComplete = true;
    notifyListeners();
  }

  // Update profile
  void updateProfile({String? name, String? profileImage}) {
    if (name != null) _userName = name;
    if (profileImage != null) _userProfileImage = profileImage;
    notifyListeners();
  }

  // Logout
  void logout() {
    _isLoggedIn = false;
    _isOnboardingComplete = false;
    _userRole = null;
    _userId = null;
    _userName = null;
    _userEmail = null;
    _userProfileImage = null;
    notifyListeners();
  }
}
