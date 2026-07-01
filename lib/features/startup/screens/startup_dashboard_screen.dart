import 'package:flutter/material.dart';

class StartupDashboardScreen extends StatefulWidget {
  const StartupDashboardScreen({Key? key}) : super(key: key);

  @override
  State<StartupDashboardScreen> createState() => _StartupDashboardScreenState();
}

class _StartupDashboardScreenState extends State<StartupDashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Startup Dashboard',
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ),
    );
  }
}
