import 'package:flutter/material.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  int currentQuestion = 0;
  String selectedAnswer = '';
  bool onSelected = false;
  List<Map<String, dynamic>> mathQuiz = [
    {
      'question': 'What is the value of π (pi) to two decimal places?',
      'options': ['3.14', '2.78', '4.20', '1.62'],
      'correctAnswer': '3.14',
    },
    {
      'question': 'Solve for x: 2x + 5 = 15',
      'options': ['5', '6', '7', '8'],
      'correctAnswer': '5',
    },
    {
      'question': 'What is the square root of 25?',
      'options': ['5', '6', '7', '8'],
      'correctAnswer': '5',
    },
    {
      'question':
          'In a right-angled triangle, what is the length of the hypotenuse if the other two sides are 3 and 4?',
      'options': ['5', '6', '7', '8'],
      'correctAnswer': '5',
    },
    {
      'question': 'What is the value of 8! (factorial of 8)?',
      'options': ['40320', '362880', '720', '1440'],
      'correctAnswer': '40320',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            height: 200,
            width: double.infinity,
            decoration: const BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.all(Radius.circular(30))),
            child: Center(
              child: Text(
                mathQuiz[currentQuestion]['question'],
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Flexible(
            flex: 2,
            child: SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(4, (index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                                minimumSize: const Size(double.infinity, 50),
                                backgroundColor: onSelected
                                    ? (mathQuiz[currentQuestion]
                                                    ['correctAnswer'] ==
                                                mathQuiz[currentQuestion]
                                                    ['options'][index] &&
                                            selectedAnswer ==
                                                mathQuiz[currentQuestion]
                                                    ['options'][index])
                                        ? (Colors.green)
                                        : (mathQuiz[currentQuestion]
                                                        ['correctAnswer'] !=
                                                    mathQuiz[currentQuestion]
                                                        ['options'][index] &&
                                                selectedAnswer ==
                                                    mathQuiz[currentQuestion]
                                                        ['options'][index])
                                            ? Colors.red
                                            : null
                                    : null),
                            onPressed: () {
                              setState(() {
                                selectedAnswer =
                                    mathQuiz[currentQuestion]['options'][index];
                                onSelected = true;
                              });
                            },
                            child: Text(
                                mathQuiz[currentQuestion]['options'][index]),
                          ),
                        );
                      })),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (currentQuestion < mathQuiz.length - 1) {
                          currentQuestion = currentQuestion + 1;
                          onSelected = false;
                        } else {
                          (currentQuestion = 0);
                        }
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        foregroundColor: Colors.white,
                        minimumSize: const Size(double.infinity, 50)),
                    child: const Text(
                      'Next',
                      style: TextStyle(fontSize: 18),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
