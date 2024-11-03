import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField(
      {required this.text, required this.hintText, this.icon, super.key});

  final String text;
  final String hintText;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Text(
        text,
        style: const TextStyle(
          fontSize: 18,
        ),
      ),
      const SizedBox(height: 8),
      TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            prefixIcon: icon != null
                ? Icon(
                    icon,
                    color: Colors.grey.withOpacity(0.4),
                  )
                : null,
            hintText: hintText,
            hintStyle: TextStyle(
              color: Colors.grey.withOpacity(0.4),
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
            contentPadding: icon != null ? const EdgeInsets.symmetric(vertical: 16) : const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.grey,
                width: 0.5,
              )
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.grey, // Màu xám nhạt cho viền khi không được chọn
                width: 0.7, // Độ dày của viền
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.grey, // Màu xám nhạt cho viền khi được chọn
                width: 0.7, // Độ dày của viền
              ),
            ),
        ),
      ),
    ]);
  }
}
