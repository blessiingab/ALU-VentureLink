import 'package:flutter/material.dart';

class ChatDetailScreen extends StatelessWidget {
  final String userId;

  const ChatDetailScreen({Key? key, required this.userId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chat')),
      body: Center(child: Text('Chat with $userId')),
    );
  }
}
