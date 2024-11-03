import 'package:flutter/material.dart';
import 'package:flutter_asms_practice_3/add_car_start_page.dart';
import 'package:flutter_asms_practice_3/button.dart';
import 'package:flutter_asms_practice_3/title_description.dart';

class CardListPage extends StatelessWidget {
  const CardListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Success Message Box
            Container(
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Row(
                children: [
                  Icon(Icons.check_circle, color: Colors.green),
                  SizedBox(width: 8),
                  Text(
                    'Your card successfully added',
                    style: TextStyle(color: Colors.green, fontSize: 16),
                  ),
                ],
              ),
            ),
            // Title and Description
            const TitleDescription(
                title: 'Card list',
                description: 'Enter your credit card info into the box below.'),
            const SizedBox(height: 16),
            // Card Item
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 6,
                    spreadRadius: 2,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/mastercard_logo.png', // Đường dẫn tới logo của thẻ
                        width: 30,
                        height: 30,
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'Account  ************3994',
                        style: TextStyle(fontSize: 16, color: Colors.black87),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      // Xử lý sự kiện xóa thẻ
                    },
                    icon: const Icon(Icons.delete, color: Colors.red),
                  ),
                ],
              ),
            ),
            const Spacer(),
            // Buttons at Bottom
            Column(
              children: [
                Padding(
                    padding: const EdgeInsets.only(bottom: 28),
                    child: CustomButton(
                        text: 'Add another card',
                        icon: Icons.add,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AddCarStartPage(),
                            ),
                          );
                        })),
                Padding(
                    padding: const EdgeInsets.only(bottom: 28),
                    child: CustomButton(
                        text: 'Continue',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AddCarStartPage(),
                            ),
                          );
                        })),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
