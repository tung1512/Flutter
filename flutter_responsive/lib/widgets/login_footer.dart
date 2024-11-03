import 'package:flutter/material.dart';

class LoginFooter extends StatelessWidget {
  const LoginFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '© 2023 Circle. All Rights Reserved',
            style: TextStyle(
                fontSize: 16, color: Colors.white, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
