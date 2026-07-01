import 'package:flutter/material.dart';

class StartupListScreen extends StatelessWidget {
  const StartupListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Startups')),
      body: const Center(child: Text('Startups List')),
    );
  }
}
