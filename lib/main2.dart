import 'package:alu_venture_link/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp();
  } catch (_) {
    // Firebase configuration is optional for the local demo build.
  }

  runApp(const ALUVentureLinkApp());
}
