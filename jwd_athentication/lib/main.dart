import 'package:flutter/material.dart';
import 'package:jwd_athentication/pages/login_page.dart';
import 'package:jwd_athentication/pages/register_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/' : (context) => const LoginPage(),
        '/register' : (context) => RegisterPage(),
      },
    );
  }
}
