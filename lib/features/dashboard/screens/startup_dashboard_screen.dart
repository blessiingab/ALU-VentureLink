import 'package:flutter/material.dart';

class StartupDashboardScreen extends StatelessWidget {
  const StartupDashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Startup Dashboard')),
      body: const Center(child: Text('Startup Dashboard')),
    );
  }
}
