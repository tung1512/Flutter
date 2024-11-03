import 'package:flutter/material.dart';
import 'package:flutter_asms_practice_3/add_email.dart';

class AccountSetup extends StatelessWidget{
  const AccountSetup({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const AddEmail(),
    );
  }


}