import 'package:flutter/material.dart';

class DarkModeToggle extends StatelessWidget {
  const DarkModeToggle({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8.0), // Thêm padding để tạo không gian cho icon
        decoration: BoxDecoration(
          color: Colors.grey, // Màu nền của icon
          border: Border.all(color: Colors.grey, width: 2), // Đường viền
          borderRadius: BorderRadius.circular(50), // Bo tròn các góc
        ),
        child: const Icon(
          Icons.dark_mode,
          color: Colors.black87, // Màu của icon
        ),
      ),
      title: const Text('Dark Mode'),
      trailing: Switch(
        value: false,
        onChanged: (bool value) {
          // Implement dark mode toggle logic
          print('Change mode: $value');
        },
      ),
    );
  }
}
