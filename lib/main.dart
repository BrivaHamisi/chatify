import 'package:flutter/material.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import './pages/login_page.dart';
import 'package:provider/provider.dart';
import '../providers/auth_providers.dart';
import '../pages/registration_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AuthProvider.initializeFirebase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chatify',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Color.fromRGBO(42, 117, 188, 1),
        colorScheme: const ColorScheme.dark(
          primary: Color.fromRGBO(42, 117, 188, 1),
          secondary: Color.fromRGBO(28, 27, 27, 1),
        ),
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: RegistrationPage(),
    );
  }
}