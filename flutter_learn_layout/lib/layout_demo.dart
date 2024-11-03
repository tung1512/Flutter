import 'package:flutter/material.dart';
import 'package:flutter_learn_layout/utilities.dart';

class LayoutDemo extends StatelessWidget {
  const LayoutDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter layout demo'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Image.asset(
              'assets/images/background.jpg',
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            const Row(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Column(children: [
                    Text(
                        'Oeschinen Lake Campground'),
                    Text('Kandersteg, Swizerland')
                  ]),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star_rate,
                      color: Colors.orange,
                    ),
                    Text('41'),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Utilities(Icons.call, 'Call'),
                Utilities(Icons.route, 'Route'),
                Utilities(Icons.share, 'Share'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
