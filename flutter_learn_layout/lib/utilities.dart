import 'package:flutter/material.dart';

class Utilities extends StatelessWidget{
  const Utilities(this.iconImg, this.textIcon,{super.key});

  final IconData iconImg;
  final String textIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(iconImg),
        Text(textIcon),
      ],
    );
  }

}