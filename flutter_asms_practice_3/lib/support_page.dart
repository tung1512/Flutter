import 'package:flutter/material.dart';
import 'package:flutter_asms_practice_3/bottom_navigation.dart';
import 'package:flutter_asms_practice_3/my_action_button.dart';
import 'package:flutter_asms_practice_3/support_chat_page.dart';

void main() {
  runApp(const HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        fontFamily: 'Montserrat',
        useMaterial3: true,
      ),
      home: const SupportPage(),
    );
  }
}

class SupportPage extends StatelessWidget {
  static const blueHomePage = Color(0xff304ffe);
  static const whiteAppBackground = Color(0xfff7f7f7);
  static const divider = Color(0xffededed);
  static const textFieldBorder = Color(0xffcdcdcd);
  static String supportDes =
      "Our dedicated team is here to assist you with any question or issues related to our Coinpay mobile app.";

  const SupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: whiteAppBackground,
        appBar: AppBar(
          backgroundColor: whiteAppBackground,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.of(context).pop(); // Back navigation
            },
          ),
          title: const Text(
            'Support',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/support_image.png',
                width: double.infinity,
                height: 350,
                fit: BoxFit.contain,
              ),
              const Text(
                'CoinPay Support',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                supportDes,
                style: const TextStyle(fontSize: 14),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 40,
              ),
              MyActionButton(
                  buttonText: 'Start Chat',
                  iconData: Icons.chat_bubble_outlined,
                  onPressed: () {
                    Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SupportChatPage(),
                  ),
                );
                  },
                  backgroundColor: blueHomePage,
                  contentColor: whiteAppBackground),
              const SizedBox(
                height: 10,
              ),
              MyActionButton(
                  buttonText: 'View FAQ',
                  iconData: Icons.question_mark,
                  onPressed: () {
                    Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SupportChatPage(),
                  ),
                );
                  },
                  backgroundColor: whiteAppBackground,
                  contentColor: blueHomePage),
            ],
          ),
        ),
        bottomNavigationBar: const BottomNavigation(),
      ),
    );
  }
}
