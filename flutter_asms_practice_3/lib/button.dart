import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final IconData? icon;
  final VoidCallback onPressed;

  const CustomButton(
      {super.key, required this.text, this.icon, required this.onPressed});

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool _isPressed = false;

  void _handlePress() {
    setState(() {
      _isPressed = true;
    });

    // Call the onPressed function passed from the parent widget
    widget.onPressed();

    // Reset the button state after a delay (if needed)
    Future.delayed(const Duration(milliseconds: 200), () {
      setState(() {
        _isPressed = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: _handlePress,
      icon: widget.icon != null
          ? Icon(widget.icon, color: _isPressed ? Colors.white : Colors.white)
          : null,
      label: Text(
        widget.text,
        style: TextStyle(color: _isPressed ? Colors.white : Colors.grey[800], fontSize: 18), // Set text color
      ),
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),
        backgroundColor: _isPressed ? Colors.blue : Colors.grey[400], // Change background color
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      ),
    );
  }
}
