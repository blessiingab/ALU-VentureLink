import 'package:flutter/material.dart';
import '../../models/startup_model.dart';

class StartupProvider extends ChangeNotifier {
  List<Startup> _startups = [];
  Startup? _selectedStartup;
  bool _isLoading = false;

  List<Startup> get startups => _startups;
  Startup? get selectedStartup => _selectedStartup;
  bool get isLoading => _isLoading;

  Future<void> fetchStartups() async {
    _isLoading = true;
    notifyListeners();
    try {
      await Future.delayed(const Duration(seconds: 1));
      _startups = [
        Startup(
          id: '1',
          name: 'TechHub Africa',
          description: 'Building AI solutions for African problems',
          founderId: 'founder_1',
          stage: 'growth',
          followers: 250,
          verified: true,
          createdAt: DateTime.now(),
        ),
        Startup(
          id: '2',
          name: 'EduTech Solutions',
          description: 'EdTech platform for African students',
          founderId: 'founder_2',
          stage: 'early-stage',
          followers: 150,
          verified: false,
          createdAt: DateTime.now(),
        ),
      ];
    } catch (e) {
      // Handle error
    }
    _isLoading = false;
    notifyListeners();
  }

  Future<void> fetchStartupDetail(String startupId) async {
    _isLoading = true;
    notifyListeners();
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      _selectedStartup = _startups.firstWhere((s) => s.id == startupId);
    } catch (e) {
      // Handle error
    }
    _isLoading = false;
    notifyListeners();
  }
}
