import 'package:flutter/material.dart';
import 'package:flutter_asms_6/home_page.dart';
import 'package:flutter_asms_6/my_profile.dart';
import 'package:flutter_asms_6/profile_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Asms',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
        )
      ),
      // home: MyProfile(),
      home: HomePage(),
    );
  }
}
