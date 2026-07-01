import 'package:flutter/material.dart';

class OpportunityDetailScreen extends StatelessWidget {
  final String opportunityId;

  const OpportunityDetailScreen({Key? key, required this.opportunityId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Opportunity')),
      body: Center(child: Text('Opportunity: $opportunityId')),
    );
  }
}
