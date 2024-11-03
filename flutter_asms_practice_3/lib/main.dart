import 'package:flutter/material.dart';
import 'package:flutter_asms_practice_3/account_setup.dart';
import 'package:flutter_asms_practice_3/adding_card.dart';
import 'package:flutter_asms_practice_3/error404_page.dart';
import 'package:flutter_asms_practice_3/spending_page.dart';
import 'package:flutter_asms_practice_3/support_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const AccountSetup(),
      // home: const Error404Page(),
      // home: const AddingCard(),
      // home: const SupportPage(),
      home: const SpendingPage(),
    );
  }
}
