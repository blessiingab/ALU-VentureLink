import 'package:flutter/material.dart';

class BrowseStartupsScreen extends StatefulWidget {
  const BrowseStartupsScreen({Key? key}) : super(key: key);

  @override
  State<BrowseStartupsScreen> createState() => _BrowseStartupsScreenState();
}

class _BrowseStartupsScreenState extends State<BrowseStartupsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Browse Startups Screen',
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ),
    );
  }
}
