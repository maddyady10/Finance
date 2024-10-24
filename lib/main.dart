import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; // Add this import
import 'firebase_options.dart'; // Add this import if using flutterfire_cli
import 'login_page.dart'; // Import the LoginPage

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure Flutter is fully initialized
  await Firebase.initializeApp(); // Initialize Firebase
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OLD PEOPLE',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 19, 153, 236)),
        useMaterial3: true,
      ),
      home: LoginPage(), // Set the home page to the LoginPage
    );
  }
}
