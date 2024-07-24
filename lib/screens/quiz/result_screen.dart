import 'package:flutter/material.dart';
import 'package:math_web/screens/quiz/quiz_main.dart';

class ResultScreen extends StatefulWidget {
  final int score;
  const ResultScreen(this.score, {super.key});

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Gutlaýan",
                style: TextStyle(
                    fontFamily: 'Rubik',
                    color: Colors.black,
                    fontSize: 38.0,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20.0),
              const Text(
                "Siziň netijäňiz:",
                style: TextStyle(
                    fontFamily: 'Rubik',
                    color: Colors.black,
                    fontSize: 28.0,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 50.0,
              ),
              Text(
                "${widget.score}",
                style: const TextStyle(
                    color: Colors.green,
                    fontSize: 80.0,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 60.0),
              OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const QuizMain()));
                  },
                  child: const Text("Testi gaýtala",
                      style: TextStyle(
                        fontSize: 17,
                        fontFamily: 'Rubik',
                      )))
            ],
          ),
        ));
  }
}
