import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget{

  const BottomNavBar({super.key});

  final Map<int, String> navMessages = const {
    0: 'Navigator Home',
    1: 'Navigator Chart',
    2: 'Navigator QR Code',
    3: 'Navigator Message',
    4: 'Navigator Profile',
  };

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      // backgroundColor: Colors.white,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      items: const[
       BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
       BottomNavigationBarItem(icon: Icon(Icons.pie_chart), label: 'Chart'),
       BottomNavigationBarItem(icon: Icon(Icons.qr_code_scanner), label: 'QR Code'),
       BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline), label: 'Message'),
       BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
    ],
    currentIndex: 2,
    onTap: (int index) {
      print(navMessages[index] ?? 'Unknown Navigator');
    },);
  }
}