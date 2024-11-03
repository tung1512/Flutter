import 'package:flutter/material.dart';
import 'package:flutter_asms_practice_3/add_card.dart';
import 'package:flutter_asms_practice_3/button.dart';
import 'package:flutter_asms_practice_3/card_list.dart';
import 'package:flutter_asms_practice_3/title_description.dart';

class CardVerificationPage extends StatefulWidget {
  const CardVerificationPage({super.key});
  @override
  State<CardVerificationPage> createState() => _CardVerificationPageState();
}

class _CardVerificationPageState extends State<CardVerificationPage> {
  final TextEditingController _otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            const Size.fromHeight(56), // Chiều cao tiêu chuẩn của AppBar
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
              icon: const Icon(Icons.arrow_back, color: Colors.black),
            ),
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(top: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const TitleDescription(
                  title: 'Verify your card',
                  description:
                      'We sent a 6-digit code to yourname@example.com'),
              const SizedBox(height: 32),
              // Dòng nhập mã xác thực
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(6, (index) {
                  return Container(
                    width: 40,
                    height: 50,
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.grey,
                          width: 2.0,
                        ),
                      ),
                    ),
                    child: Center(
                      child: TextField(
                        controller: _otpController,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        maxLength: 1,
                        decoration: const InputDecoration(
                          counterText: '', // Remove character counter
                          border: InputBorder.none,
                        ),
                        onChanged: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                      ),
                    ),
                  );
                }),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Didn't get a code?",
                    style: TextStyle(color: Colors.black54),
                  ),
                  TextButton(
                    onPressed: () {
                      // Handle resend code logic
                    },
                    child: const Text(
                      'Resend',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 28),
                child: CustomButton(
                    text: 'Verify',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CardListPage(),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
