import 'package:flutter/material.dart';

class MyActionButton extends StatelessWidget {
  final String buttonText;
  final IconData iconData;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color contentColor;

  const MyActionButton({
    super.key,
    required this.buttonText,
    required this.iconData,
    required this.onPressed,
    required this.backgroundColor,
    required this.contentColor,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: contentColor, width: 2),
        backgroundColor: backgroundColor,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(35),
        ),
      ),
      child: SizedBox(
        height: 35,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(iconData, color: contentColor),
            const SizedBox(width: 8),
            Text(
              buttonText,
              style: TextStyle(color: contentColor, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
