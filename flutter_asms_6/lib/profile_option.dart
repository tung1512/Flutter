import 'package:flutter/material.dart';

class ProfileOption extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  const ProfileOption({
    required this.icon,
    required this.label,
    required this.color,
    super.key,
  });

  void printTextAction() {
    print('Click $label');
  }

  @override
  Widget build(BuildContext context) {
    Color borderColor = color.withOpacity(0.3); // Tạo màu nhạt hơn cho border

    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: borderColor,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Icon(icon, color: color), // Màu của icon
      ),
      title: Text(label),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {
        printTextAction();
      },
    );
  }
}
