import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:quizzler/data/data.dart';

class FirstScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FirstScreenState();
  }
}

class FirstScreenState extends State<FirstScreen> {
  int index = 0;
  int score = 0;
  String question = '';
  final double progress = (1.0 / questions.length);
  double progressValue = 0.0;
  late bool hasWon;
  String winMassege = 'Congratulations You Have Won';
  String loseMassege = 'You Have Lost Better Luck Next Time';
  updateQuestion() {
    progressValue += progress;
    setState(() {});
    index++;
    if (index == 13) {
      hasWon = score > 6;
      index = 0;
      String massege = hasWon ? winMassege : loseMassege;
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('End of Quiz'),
              content: Text('$massege and Your Score is $score out of 13'),
              actions: [
                hasWon
                    ? Lottie.asset('assets/animation/win.json')
                    : Lottie.asset('assets/animation/lose.json'),
                TextButton(
                    onPressed: () {
                      score = 0;
                      progressValue = 0.0;
                      setState(() {});
                      Navigator.of(context).pop();
                    },
                    child: const Text("OK")),
              ],
            );
          });
    } else {
      question = questions[index];
      setState(() {});
    }
  }

  checkAnswer(bool userSelection) {
    bool correctAnswer = answers[index];
    if (userSelection == correctAnswer) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          'Right Answer',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        duration: Duration(milliseconds: 300),
        backgroundColor: Colors.greenAccent,
        elevation: 3.0,
      ));
      score++;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          'Wrong Answer',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        duration: Duration(milliseconds: 300),
        backgroundColor: Colors.redAccent,
        elevation: 3.0,
      ));
    }
    updateQuestion();
  }

  @override
  Widget build(BuildContext context) {
    question = questions[index];
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.yellowAccent,
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 2.5,
              child: Text(
                textAlign: TextAlign.center,
                question,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 60,
                  width: 110,
                  child: ElevatedButton(
                      onPressed: () => checkAnswer(true),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.yellowAccent),
                      ),
                      child: Lottie.asset(
                        'assets/animation/true.json',
                      )),
                ),
                SizedBox(
                  height: 60,
                  width: 110,
                  child: ElevatedButton(
                    onPressed: () => checkAnswer(false),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.yellowAccent),
                    ),
                    child: Lottie.asset('assets/animation/false.json'),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text('Yuor Score is $score/13'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: LinearProgressIndicator(
                backgroundColor: Colors.yellowAccent,
                valueColor:
                    const AlwaysStoppedAnimation<Color>(Colors.greenAccent),
                value: progressValue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
