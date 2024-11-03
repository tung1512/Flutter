import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 400, // Specify a fixed width or adjust as needed
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Email', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black),),
            const SizedBox(
              height: 8,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'name@example.com',
                hintStyle: TextStyle(
                  color: Colors.grey.withOpacity(0.4),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(
                    color:
                        Colors.grey.withOpacity(0.2), // Semi-transparent border
                    width: 1,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text('Password', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black),),
            const SizedBox(
              height: 8,
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Your password',
                hintStyle: TextStyle(
                  color: Colors.grey.withOpacity(0.4),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(
                    color:
                        Colors.grey.withOpacity(0.2), // Semi-transparent border
                    width: 1,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(19, 82, 241, 1),
                padding: const EdgeInsets.symmetric(vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Login',
                style: TextStyle(
                    fontSize: 16, color: Color.fromRGBO(255, 255, 255, 1)),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text('Don\'t have an account?'),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Sign up',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
