import 'package:flutter/material.dart';
import 'quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizBrain = QuizBrain();

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      home: _HomeWidget(),
    );
  }
}

class _HomeWidget extends StatefulWidget {
  @override
  __HomeWidgetState createState() => __HomeWidgetState();
}

class __HomeWidgetState extends State<_HomeWidget> {
  List<Icon> scoreKeepar = [];

  // void finished() {
  //   if (quizBrain.isFinished() == true) {
  //     Alert(
  //             context: context,
  //             title: 'Finished',
  //             desc: 'You have Reached the end of Quiz')
  //         .show();
  //     quizBrain.reset();
  //     scoreKeepar = [];
  //   } else {
  //     quizBrain.nextQuestion();
  //   }
  // }

  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = quizBrain.getCorrectAnswer();
    setState(() {
      if (quizBrain.isFinished() == true) {
        Alert(context: context, title: 'Finished').show();
        quizBrain.reset();
        scoreKeepar = [];
      } else {
        if (userPickedAnswer == correctAnswer) {
          scoreKeepar.add(
            Icon(
              Icons.check,
              color: Colors.green,
            ),
          );
        } else {
          scoreKeepar.add(
            Icon(
              Icons.close,
              color: Colors.red,
            ),
          );
        }
        quizBrain.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        backgroundColor: Colors.cyanAccent,
        title: Center(
          child: Text('Quiz App'),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              flex: 5,
              child: Center(
                child: Text(
                  quizBrain.getQuestionText(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
              )),
          Expanded(
              child: Padding(
            padding: EdgeInsets.all(10),
            child: FlatButton(
              color: Colors.green,
              onPressed: () {
                checkAnswer(true);
              },
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          )),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: FlatButton(
                color: Colors.red,
                onPressed: () {
                  checkAnswer(false);
                },
                child: Text(
                  'False',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
          Row(
            children: scoreKeepar,
          )
        ],
      ),
    );
  }
}
