import 'package:flutter/material.dart';

class StartupDetailScreen extends StatelessWidget {
  final String startupId;

  const StartupDetailScreen({Key? key, required this.startupId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Startup Details')),
      body: Center(child: Text('Startup: $startupId')),
    );
  }
}
