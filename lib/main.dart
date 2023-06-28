import 'package:dailycost/pages/auth_page.dart';
import 'package:dailycost/pages/home_page.dart';
import 'package:dailycost/pages/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      routes: {
        LoginPage.routeName: (context) => LoginPage(),
        HomePage.routeName: (context) => const HomePage(),
        AuthPage.routeName: (context) => AuthPage(
              isLoggedIn: false,
              accessToken: '',
            ),
      },
    );
  }
}
