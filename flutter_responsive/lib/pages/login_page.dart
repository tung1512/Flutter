import 'package:flutter/material.dart';
import 'package:flutter_responsive/widgets/desktop_layout.dart';
import 'package:flutter_responsive/widgets/login_description.dart';
import 'package:flutter_responsive/widgets/login_form.dart';
import 'package:flutter_responsive/widgets/logo_widget.dart';
import 'package:flutter_responsive/widgets/mobie_layout.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/decoration.png'),
              fit: BoxFit.cover,
              alignment: Alignment.topLeft,
            ),
            color: Color(0xff041643),
          ),
          child: LayoutBuilder(builder: (context,constrains){
            if(constrains.maxWidth < 600){
              return MobileLayout();
            }else{
              return const DesktopLayout();
            }
          }),
        ),
      ),
    );
  }
}
