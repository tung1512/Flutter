import 'package:flutter/material.dart';
import 'package:flutter_responsive/widgets/login_description.dart';
import 'package:flutter_responsive/widgets/login_footer.dart';
import 'package:flutter_responsive/widgets/login_form.dart';
import 'logo_widget.dart';

class DesktopLayout extends StatelessWidget {
  const DesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(20),
        constraints: const BoxConstraints(maxWidth: 1200),
        child: const Column(
          // Changed from Row to Column
          children: [
            // Logo taking 1/3 of the screen height
            Flexible(
              flex: 1, // 1 part of the total 3 parts
              child: Center(child: LogoWidget()), // Center the logo
            ),
            // Row for LoginDescription and LoginForm
            Flexible(
              flex: 2, // 2 parts of the total 3 parts
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: LoginDescription(),
                  ),
                  SizedBox(width: 20), // Space between the description and form
                  Expanded(
                    child: LoginForm(),
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: LoginFooter(),
            ),
          ],
        ),
      ),
    );
  }
}
