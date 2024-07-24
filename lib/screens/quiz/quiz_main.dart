import 'package:flutter/material.dart';

import 'package:math_web/screens/quiz/questions_list.dart';
import 'package:math_web/screens/quiz/result_screen.dart';

class QuizMain extends StatefulWidget {
  const QuizMain({super.key});

  @override
  _QuizMainState createState() => _QuizMainState();
}

class _QuizMainState extends State<QuizMain> {
  Color mainColor = const Color(0xFF252c4a);
  Color secondColor = const Color(0xFF117eeb);

  final PageController _controller = PageController(initialPage: 0);

  bool isPressed = false;
  Color isTrue = const Color(0xBF30AD6E);
  Color isWrong = const Color(0xBFEB5757);
  Color btnColor = const Color(0xFF117eeb);
  int score = 0;
  bool isAnswerTrue = false;
  int pressedIndex = 0;
  List<String> harp = ['A', 'B', 'Ç', 'D'];

  @override
  Widget build(BuildContext context) {
    double sizedWidth = MediaQuery.of(context).size.width;
    double sizeHeight = MediaQuery.of(context).size.height;
    width:
    sizedWidth * 80;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            'Test',
            style: TextStyle(fontFamily: 'Rubik', color: Colors.black),
          ),
          elevation: 1,
          automaticallyImplyLeading: true,
          // leading: IconButton(
          //   icon: Icon(
          //     Icons.arrow_back_ios,
          //     color: Colors.black,
          //     size: 20,
          //   ),
          //   onPressed: (){
          //     Navigator.push(context,MaterialPageRoute(builder: (context)=> new MyApp()));
          //   },
          // ),
        ),
        backgroundColor: Colors.white,
        body: Padding(
            padding: const EdgeInsets.all(18.0),
            child: PageView.builder(
              physics: const NeverScrollableScrollPhysics(),
              controller: _controller,
              onPageChanged: (page) {
                setState(() {
                  isPressed = false;
                });
              },
              itemCount: questions.length,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: RichText(
                          text: TextSpan(
                              text: "Sorag ${index + 1}/",
                              style: const TextStyle(
                                  color: Color(0xBF0F7EEC),
                                  fontFamily: "Rubik",
                                  fontWeight: FontWeight.w700,
                                  fontSize: 40.0),
                              children: [
                            TextSpan(
                              text: "${questions.length}",
                              style: const TextStyle(
                                  color: Color(0xBF0F7EEC),
                                  fontFamily: "Rubik",
                                  fontSize: 25.0),
                            )
                          ])),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 25, right: 25, top: 10),
                      child: Divider(
                        color: Color(0xBFE3E7EE),
                        height: 8.0,
                        thickness: 2.0,
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25, right: 25),
                      child: Text(
                        questions[index].question,
                        softWrap: true,
                        style: const TextStyle(
                          color: Colors.black,
                          fontFamily: "Rubik",
                          fontSize: 19.0,
                        ),
                      ),
                    ),
                    const SizedBox(height: 35.0),
                    for (int i = 0; i < questions[index].answer.length; i++)
                      Container(
                        width: double.infinity,
                        height: 70,
                        margin: const EdgeInsets.only(
                            bottom: 18.0, left: 10, right: 10),
                        child: MaterialButton(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0)),
                          color: (isPressed && pressedIndex == i)
                              ? questions[index]
                                      .answer
                                      .entries
                                      .toList()[i]
                                      .value
                                  ? isTrue
                                  : isWrong
                              : Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 18.0),
                          onPressed: isPressed
                              ? () {}
                              : () {
                                  setState(() {
                                    isPressed = true;
                                    pressedIndex = i;
                                  });
                                  if (questions[index]
                                      .answer
                                      .entries
                                      .toList()[i]
                                      .value) {
                                    isAnswerTrue = true;
                                    score += 5;
                                    print(score);
                                  } else {
                                    isAnswerTrue = false;
                                  }
                                },
                          child: Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 20),
                                child: Chip(
                                  label: Text(harp[i]),
                                  backgroundColor: const Color(0xBFF1E7FF),
                                ),
                              ),
                              Text(questions[index].answer.keys.toList()[i],
                                  style: TextStyle(
                                      color: (isPressed && pressedIndex == i)
                                          ? Colors.white
                                          : Colors.black)),
                            ],
                          ),
                        ),
                      ),
                    const SizedBox(height: 30.0),
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      const SizedBox(
                        width: 20,
                      ),
                      (index != 0)
                          ? SizedBox(
                              width: 145,
                              height: 50,
                              child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0)),
                                  ),
                                  onPressed: () {
                                    _controller.previousPage(
                                        duration:
                                            const Duration(milliseconds: 500),
                                        curve: Curves.linear);
                                    setState(() {
                                      if (isAnswerTrue) score = score - 5;
                                      isPressed = false;
                                    });
                                  },
                                  child: const Row(
                                    children: [
                                      Icon(
                                        Icons.arrow_back_ios,
                                        color: Color(0xBF0F7EEC),
                                        size: 20,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'Yza',
                                        style: TextStyle(
                                            fontFamily: 'Rubik',
                                            color: Color(0xBF0F7EEC),
                                            fontSize: 15),
                                      ),
                                    ],
                                  )),
                            )
                          : const SizedBox(
                              width: 145,
                            ),
                      const SizedBox(
                        width: 60,
                      ),
                      SizedBox(
                        width: 145,
                        height: 50,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0)),
                          ),
                          onPressed: isPressed
                              ? index + 1 == questions.length
                                  ? () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ResultScreen(score)));
                                    }
                                  : () {
                                      _controller.nextPage(
                                          duration:
                                              const Duration(milliseconds: 500),
                                          curve: Curves.linear);
                                      setState(() {
                                        isPressed = false;
                                      });
                                    }
                              : null,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                  index + 1 == questions.length
                                      ? "Netije "
                                      : "Indiki sorag",
                                  //textAlign: TextAlign.end,
                                  style: const TextStyle(
                                      color: Color(0xBF0F7EEC),
                                      fontSize: 15,
                                      fontFamily: 'Rubik')),
                              const SizedBox(
                                width: 5,
                              ),
                              const Icon(
                                Icons.arrow_forward_ios,
                                color: Color(0xBF0F7EEC),
                                size: 20,
                              ),
                            ],
                          ),
                        ),
                      )
                    ])
                  ],
                );
              },
            )));
  }
}
