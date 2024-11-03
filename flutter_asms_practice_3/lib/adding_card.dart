import 'package:flutter/material.dart';
import 'package:flutter_asms_practice_3/add_car_start_page.dart';
import 'package:flutter_asms_practice_3/add_email.dart';

class AddingCard extends StatelessWidget{
  const AddingCard({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: AddCarStartPage(),
    );
  }


}