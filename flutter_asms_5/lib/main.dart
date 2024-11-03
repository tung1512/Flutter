import 'package:flutter/material.dart';
import 'package:flutter_asms_5/profile_card.dart';

void main(){
  runApp(const MaterialApp(
    home: Scaffold(
      body: Center(
        child: ProfileCard(
          name: 'Dương Văn Tùng',
          description: 'Developer in fsoft',
          imagePath: 'assets/images/avt2.jpg'
        ),
      ),
    ),
  ));
}