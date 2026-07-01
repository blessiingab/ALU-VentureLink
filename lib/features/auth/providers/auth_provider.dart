import 'package:flutter/material.dart';
import '../../models/user_model.dart';

class AuthProvider extends ChangeNotifier {
  User? _currentUser;
  bool _isLoggedIn = false;
  bool _isLoading = false;

  User? get currentUser => _currentUser;
  bool get isLoggedIn => _isLoggedIn;
  bool get isLoading => _isLoading;
  String? get userRole => _currentUser?.userType;

  Future<void> login(String email, String password) async {
    _isLoading = true;
    notifyListeners();
    try {
      await Future.delayed(const Duration(seconds: 1));
      _currentUser = User(
        id: 'user_123',
        name: 'John Doe',
        email: email,
        userType: 'student',
        university: 'African Leadership University',
        course: 'Computer Science',
        createdAt: DateTime.now(),
      );
      _isLoggedIn = true;
    } catch (e) {
      _isLoggedIn = false;
    }
    _isLoading = false;
    notifyListeners();
  }

  Future<void> signup(String name, String email, String password, String userType) async {
    _isLoading = true;
    notifyListeners();
    try {
      await Future.delayed(const Duration(seconds: 1));
      _currentUser = User(
        id: 'user_${DateTime.now().millisecondsSinceEpoch}',
        name: name,
        email: email,
        userType: userType,
        createdAt: DateTime.now(),
      );
      _isLoggedIn = true;
    } catch (e) {
      _isLoggedIn = false;
    }
    _isLoading = false;
    notifyListeners();
  }

  Future<void> logout() async {
    _currentUser = null;
    _isLoggedIn = false;
    notifyListeners();
  }
}
