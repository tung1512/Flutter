import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Icon(
              Icons.circle_outlined,
              size: 40,
              color: Colors.blueAccent,
            ),
            Icon(
              Icons.circle,
              size: 20,
              color: Colors.blueAccent,
            ),
          ],
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          'circles',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
