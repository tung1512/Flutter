import 'package:flutter/material.dart';
import 'package:flutter_asms_practice_3/button.dart';
import 'package:flutter_asms_practice_3/country_residence.dart';
import 'package:flutter_asms_practice_3/date_picker.dart';
import 'package:flutter_asms_practice_3/home_address.dart';
import 'package:flutter_asms_practice_3/input_field.dart';
import 'package:flutter_asms_practice_3/title_description.dart';

class AddPersonInfo extends StatefulWidget {
  const AddPersonInfo({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AddPersonInfo();
  }
}

class _AddPersonInfo extends State<AddPersonInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Bọc AppBar trong Container để thêm border bottom
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
            crossAxisAlignment: CrossAxisAlignment.start, 
            children: [
            const TitleDescription(
              title: "Add your personal info",
              description:
                  "This info needs to be accurate with your ID document.",
            ),
            const SizedBox(
              height: 32,
            ),
            const InputField(
              text: "Full Name",
              hintText: "Tung Duong",
            ),
            const SizedBox(
              height: 12,
            ),
            const InputField(
              text: "User Name",
              hintText: "@username",
            ),
            const SizedBox(
              height: 12,
            ),
            const DatePicker(
              text: "Date of Birth",
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 28),
              child: CustomButton(text: 'Continue' ,onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CountryResidence(),
                  ),
                );
              }),
            ),
          ]),
        ),
      ),
    );
  }
}
