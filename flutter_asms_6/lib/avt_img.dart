import 'package:flutter/material.dart';

class AvtImg extends StatelessWidget {
  const AvtImg({required this.imgPath, required this.imgIcon, super.key});

  final String imgPath;
  final IconData imgIcon;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        ClipOval(
          child: Image.asset(
            imgPath,
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
        ),
        Icon(
          imgIcon,
          size: 40,
          color: Colors.white.withOpacity(0.5),
        ),
      ],
    );
  }
}
