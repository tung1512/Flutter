import 'package:flutter/material.dart';
import 'chat_compose_section.dart';
import 'message_bubble.dart';

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
      home: const SupportChatPage(),
    );
  }
}

class SupportChatPage extends StatelessWidget {
  const SupportChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xfff7f7f7),
        appBar: AppBar(
          backgroundColor: const Color(0xfff7f7f7),
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
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: ListView(
                  children: const [
                    Text(
                      'Sunday at 4:20 PM',
                      style: TextStyle(fontSize: 14),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    MessageBubble(
                      text: "Welcome to CoinPay support!\n How can we assist you today?",
                      isSender: false,
                      avatarUrl: "https://imgcdn.stablediffusionweb.com/2024/4/7/f9271bdd-b7f1-4b7c-9f1e-e30d71c789ef.jpg",
                      senderName: 'Coinpay Helper Bot',
                      showSenderName: true,
                      status: 'sent',
                      showStatus: false,
                    ),
                    MessageBubble(
                      text: "What is your question regarding?",
                      isSender: false,
                      avatarUrl: "https://imgcdn.stablediffusionweb.com/2024/4/7/f9271bdd-b7f1-4b7c-9f1e-e30d71c789ef.jpg",
                      senderName: 'Coinpay Helper Bot',
                      showSenderName: false,
                      status: 'sent',
                      showStatus: false,
                    ),
                    MessageBubble(
                      text: "Are you having a problem with a specific feature?",
                      isSender: false,
                      avatarUrl: "https://imgcdn.stablediffusionweb.com/2024/4/7/f9271bdd-b7f1-4b7c-9f1e-e30d71c789ef.jpg",
                      senderName: 'Coinpay Helper Bot',
                      showSenderName: false,
                      status: 'sent',
                      showStatus: false,
                    ),
                    MessageBubble(
                      text: "Have you tried troubleshooting steps we provided in FAQ or other documentation?",
                      isSender: false,
                      avatarUrl: "https://imgcdn.stablediffusionweb.com/2024/4/7/f9271bdd-b7f1-4b7c-9f1e-e30d71c789ef.jpg",
                      senderName: 'Coinpay Helper Bot',
                      showSenderName: false,
                      status: 'Just now',
                      showStatus: true,
                    ),
                    MessageBubble(
                      text: "I need help regarding my coinpay account. I can't send money",
                      isSender: true,
                      avatarUrl: "https://photo.znews.vn/w1920/Uploaded/piqbzcvo/2023_06_06/Screen_Shot_2023_06_06_at_16.32.45.png",
                      senderName: 'Coinpay Helper Bot',
                      showSenderName: false,
                      status: 'Sent',
                      showStatus: true,
                    ),
                  ],
                ),
              ),
            ),
            Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: const ChatComposeSection()),
          ],
        ),
      ),
    );
  }
}
