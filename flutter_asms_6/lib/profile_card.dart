import 'package:flutter/material.dart';
import 'package:flutter_asms_6/avt_img.dart';
import 'package:flutter_asms_6/profile_description.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 4,
              blurRadius: 8,
              offset: const Offset(0, 3),
            )
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
                onTap: () {
                  print('Edit button');
                },
                child: const Icon(
                  Icons.edit_square,
                  color: Colors.grey,
                )),
          ),
          const AvtImg(
              imgPath: 'assets/images/avt2.jpg',
              imgIcon: Icons.camera_alt_outlined),
          const SizedBox(
            height: 16,
          ),
          const ProfileDescription(
              name: 'Mehedi Hasan',
              email: 'helloyouthmind@gmail.com',
              phone: '+8801995867406'),
        ],
      ),
    );
  }
}
