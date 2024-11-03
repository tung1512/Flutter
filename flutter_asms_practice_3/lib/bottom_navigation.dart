import 'package:flutter/material.dart';

import 'navigation_item.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          // Space for the floating button
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 1,
              ),
            ],
          ),
          child: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  NavigationItem(
                    label: "home",
                    icon: Icons.home,
                    active: true,
                  ),
                  NavigationItem(
                    label: "spending",
                    icon: Icons.pie_chart_outline,
                    active: false,
                  ),
                  SizedBox(width: 30), // Space for the floating button
                  NavigationItem(
                    label: "message",
                    icon: Icons.chat_bubble_outline,
                    active: false,
                  ),
                  NavigationItem(
                    label: "account",
                    icon: Icons.person_2_outlined,
                    active: false,
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 27, // Adjusted to align with the bottom of the container
          child: FloatingActionButton(
            onPressed: () {},
            tooltip: 'Add Item',
            backgroundColor: const Color(0xFF304FFF),
            child: const Icon(
              Icons.qr_code_scanner,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
