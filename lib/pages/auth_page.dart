import 'package:flutter/material.dart';

import 'home_page.dart';
import 'login_page.dart';

class AuthPage extends StatelessWidget {
  static const String routeName = '/auth';
  final bool isLoggedIn;
  final String accessToken;

  AuthPage({super.key, required this.isLoggedIn, required this.accessToken});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    final isLoggedIn = args?['isLoggedIn'] ?? false;
    final accessToken = args?['accessToken'] ?? '';

    return Scaffold(
      body: Center(
        child: isLoggedIn ? HomePage() : LoginPage(),
      ),
    );
  }
}
