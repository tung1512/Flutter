import 'package:flutter/material.dart';
import 'package:flutter_responsive/widgets/login_description.dart';
import 'package:flutter_responsive/widgets/login_footer.dart';
import 'package:flutter_responsive/widgets/login_form.dart';
import 'logo_widget.dart';

class MobileLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              LogoWidget(),
              SizedBox(
                height: 20,
              ),
              LoginDescription(),
              SizedBox(
                height: 20,
              ),
              LoginForm(),
              SizedBox(
                height: 20,
              ),
              LoginFooter(),
            ],
          ),
        ),
      ),
    );
  }
}
