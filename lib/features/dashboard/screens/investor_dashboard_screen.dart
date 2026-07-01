import 'package:flutter/material.dart';

class InvestorDashboardScreen extends StatelessWidget {
  const InvestorDashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Investor Dashboard')),
      body: const Center(child: Text('Investor Dashboard')),
    );
  }
}
