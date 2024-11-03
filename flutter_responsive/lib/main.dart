import 'package:flutter/material.dart';
import 'package:flutter_responsive/pages/login_page.dart';
import 'package:flutter_responsive/widgets/logo_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Responsive login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Axiforma',
      ),
      home: const LoginPage(),
    );
  }
}
