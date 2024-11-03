import 'package:flutter/material.dart';

class TitleDescription extends StatelessWidget {
  final String title;
  final String description;

  const TitleDescription(
      {required this.title, required this.description, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, height: 1.2),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: const TextStyle(
              fontSize: 16,
              height: 1.2,
            ),
          )
        ],
    );
  }
}
