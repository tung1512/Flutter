import 'package:flutter/material.dart';
import 'package:flutter_asms_practice_3/add_card.dart';
import 'package:flutter_asms_practice_3/button.dart';

class AddCarStartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56), // Chiều cao tiêu chuẩn của AppBar
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(
              bottom: BorderSide(
                color: Colors.grey, // Màu của viền dưới
                width: 0.5, // Độ dày của viền dưới
              ),
            ),
          ),
          child: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
            ),
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/add_card.png', // Đường dẫn tới hình ảnh
                  height: 300,
                ),
                const SizedBox(height: 32),
                const Text(
                  "Let's add your card",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Experience the power of financial organization with our platform.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 64),
                CustomButton(
                  text: "Add your card",
                  icon: Icons.add,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AddCard()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
