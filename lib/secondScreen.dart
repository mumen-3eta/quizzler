import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SecondScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SecondScreenState();
  }
}

class SecondScreenState extends State<SecondScreen> {
  int firstNum = 0;
  int secondNum = 0;
  List<int> answers = [0, 0, 0, 0];
  int rightAnswer = 0;
  int rightAnswerPostion = 0;
  Timer timer = Timer(
    Duration.zero,
    () {},
  );
  int numberOfQuestions = 0;
  int start = 60;
  bool isVisible = true;
  int score = 0;
  late bool haswom;
  bool animate = true;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(
      oneSec,
      (timer) {
        if (start == 0) {
          haswom = score > numberOfQuestions / 2;
          animate = false;
          setState(() {
            showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('End of Quiz'),
                    content: Text(
                        'Your Score is $score out of $numberOfQuestions questions'),
                    actions: [
                      haswom
                          ? Lottie.asset('assets/animation/win.json')
                          : Lottie.asset('assets/animation/lose.json'),
                      TextButton(
                          onPressed: () {
                            animate = true;
                            score = 0;
                            numberOfQuestions = 0;
                            start = 60;
                            isVisible = true;
                            setState(() {});
                            Navigator.of(context).pop();
                          },
                          child: const Text("OK"))
                    ],
                  );
                });
            timer.cancel();
          });
        } else {
          setState(() {
            start--;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Visibility(
        replacement: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        height: 60,
                        width: 60,
                        child: Lottie.asset('assets/animation/time.json',
                            animate: animate),
                      ),
                      Text(
                        '$start Seconds',
                        style: const TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  Text(
                    'Score $score/$numberOfQuestions',
                    style: const TextStyle(fontSize: 20),
                  )
                ],
              ),
            ),
            Text(
              '$firstNum x $secondNum',
              style: const TextStyle(fontSize: 30),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 150,
                        height: 100,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.amberAccent)),
                            onPressed: () {
                              chickAnswer(answers[0]);
                            },
                            child: Text(
                              answers[0].toString(),
                              style: const TextStyle(fontSize: 30),
                            )),
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      SizedBox(
                        width: 150,
                        height: 100,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.redAccent)),
                            onPressed: () {
                              chickAnswer(answers[1]);
                            },
                            child: Text(
                              answers[1].toString(),
                              style: const TextStyle(fontSize: 30),
                            )),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 150,
                        height: 100,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.blueAccent)),
                            onPressed: () {
                              chickAnswer(answers[2]);
                            },
                            child: Text(
                              answers[2].toString(),
                              style: const TextStyle(fontSize: 30),
                            )),
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      SizedBox(
                        width: 150,
                        height: 100,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.greenAccent)),
                            onPressed: () {
                              chickAnswer(answers[3]);
                            },
                            child: Text(
                              answers[3].toString(),
                              style: const TextStyle(fontSize: 30),
                            )),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
        visible: isVisible,
        child: SizedBox(
          width: double.infinity,
          height: 400,
          child: GestureDetector(
            onTap: () {
              isVisible = false;
              newQuestions();
              startTimer();
              setState(() {});
            },
            child: Lottie.asset('assets/animation/start.json'),
          ),
        ),
      ),
    );
  }

  newQuestions() {
    numberOfQuestions++;
    var rng = Random();
    firstNum = rng.nextInt(50);
    secondNum = rng.nextInt(50);
    rightAnswer = firstNum * secondNum;
    rightAnswerPostion = rng.nextInt(4);
    answers.clear();
    for (int i = 0; i < 4; i++) {
      if (i == rightAnswerPostion) {
        answers.add(rightAnswer);
      }
      int wrongAnswer = rng.nextInt(2402);
      while (wrongAnswer == rightAnswer) {
        wrongAnswer = rng.nextInt(2402);
      }
      answers.add(wrongAnswer);
    }
    setState(() {});
  }

  chickAnswer(int answer) {
    if (answer == rightAnswer) {
      score++;
      newQuestions();
    } else {
      newQuestions();
    }
  }
}
