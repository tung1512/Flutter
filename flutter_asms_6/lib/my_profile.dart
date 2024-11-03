import 'package:flutter/material.dart';
import 'package:flutter_asms_6/DarkModeToggle.dart';
import 'package:flutter_asms_6/bottom_nav_bar.dart';
import 'package:flutter_asms_6/profile_card.dart';
import 'package:flutter_asms_6/profile_option.dart';

class MyProfile extends StatelessWidget {
  MyProfile({super.key});

  final List<Map<String, dynamic>> profileOptions = [
    {'icon': Icons.person, 'label': 'Personal Info', 'color': Colors.blue},
    {'icon': Icons.account_balance_outlined, 'label': 'Bank & Cards', 'color': Colors.orange},
    {'icon': Icons.payment, 'label': 'Transaction', 'color': Colors.red},
    {'icon': Icons.settings, 'label': 'Settings','color': Colors.blue},
    {'icon': Icons.privacy_tip, 'label': 'Data Privacy','color': Colors.green},
    {'icon': Icons.person, 'label': 'Personal Info', 'color': Colors.blue},
    {'icon': Icons.account_balance_wallet, 'label': 'Bank & Cards', 'color': Colors.orange},
    {'icon': Icons.receipt, 'label': 'Transaction', 'color': Colors.red},
    {'icon': Icons.settings, 'label': 'Settings','color': Colors.blue},
    {'icon': Icons.privacy_tip, 'label': 'Data Privacy','color': Colors.green},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: const Text('My Profile'),
        centerTitle: true,
        backgroundColor: const Color(0xFFF5F5F5),
        // foregroundColor: Colors.black,
        // elevation: 0,
      ),
      body: Column(
        children: [
          const ProfileCard(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                color: Colors.white,
                child: ListView.builder(
                  itemCount: profileOptions.length + 1,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      // DarkModeToggle được thêm vào vị trí đầu tiên
                      return const Column(
                        children: [
                          DarkModeToggle(),
                          Divider(
                            color: Colors.grey,
                            height: 1,
                            thickness: 1,
                            indent: 16,
                            endIndent: 16,
                          )
                        ],
                      );
                    }
                    // Các mục ProfileOptionTile tiếp theo
                    final option = profileOptions[index - 1];
                    return Column(
                      children: [
                        ProfileOption(
                          icon: option['icon'],
                          label: option['label'],
                          color: option['color'],
                        ),
                        // Thêm Divider sau mỗi ProfileOption
                        const Divider(
                          color: Colors.grey,
                          height: 1,
                          thickness: 1,
                          indent: 16,
                          endIndent: 16,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        margin: const EdgeInsets.only(bottom: 24),
        color: Colors.transparent,
        child: const BottomNavBar(),
      ),
    );
  }
}
