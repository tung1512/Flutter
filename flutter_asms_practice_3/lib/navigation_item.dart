import 'package:flutter/material.dart';

class NavigationItem extends StatelessWidget {
  const NavigationItem(
      {super.key,
      required this.label,
      required this.icon,
      required this.active});

  final String label;
  final IconData icon;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: active ? const Color(0xFF304FFF) : Colors.black,
          ),
          Visibility(
              visible: active,
              child: Container(
                width: 5,
                height: 5,
                decoration: const BoxDecoration(
                  color: Color(0xFF304FFF),
                  shape: BoxShape.circle,
                ),
              )),
        ],
      ),
    );
  }
}
