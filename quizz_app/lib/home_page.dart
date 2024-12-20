import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage(this.startQuiz,{super.key});

  final void Function() startQuiz;

    void _goToQuiz(){
      startQuiz();
    }

  @override
  Widget build(BuildContext context) {
    return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/quiz-logo.png',
                width: 300,
                color: const Color.fromARGB(150, 255, 255, 255),
              ),
              const SizedBox(height: 80,),
              const Text(
                'Learn Flutter the fun way!',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white
                )
              ),
              const SizedBox(height: 30,),
              OutlinedButton.icon(
                onPressed: _goToQuiz,
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                ),
                icon: const Icon(Icons.arrow_right_alt),
                label: const Text('Start Quiz'),
              )
            ],
          ),
        );
  }
}
