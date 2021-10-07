import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quiz_application/question.dart';
import 'question.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyQuizPage(),
    );
  }
}

class MyQuizPage extends StatefulWidget {
  MyQuizPage({Key? key}) : super(key: key);

  @override
  _MyQuizPageState createState() => _MyQuizPageState();
}

class _MyQuizPageState extends State<MyQuizPage> {
  List<Widget> scoreKeeper = [
    Icon(Icons.check, color: Colors.green),
    Icon(Icons.close, color: Colors.red),
  ];
  /*
  List<String> questionList = [
    ' Question one ? ',
    'Question two ?  ',
    'Question three ?',
  ];
  List<bool> questionAnswer = [
    true,
    false,
    true,
  ];*/
  int questionNumber = 0;
  void increaseQuestion() {
    setState(() {
      questionNumber++;
    });
  }

  List<Question> questionBank = [
    Question(questionText: "question one ", questionAnswer: true),
    Question(questionText: "question one ", questionAnswer: true),
    Question(questionText: "question one ", questionAnswer: true)
  ];

  void checkAnswer(bool userAnswer) {
    bool? correctAnswer = questionBank[questionNumber].questionAnswer;
    if (userAnswer == true) {
      if (correctAnswer == true) {
        scoreKeeper.add(
          Icon(Icons.check, color: Colors.green),
        );
      } else {
        scoreKeeper.add(Icon(Icons.close, color: Colors.red));
      }
    } else {
      if (correctAnswer == false) {
        scoreKeeper.add(
          Icon(Icons.check, color: Colors.green),
        );
      } else {
        scoreKeeper.add(Icon(Icons.close, color: Colors.red));
      }
    }
    // Taaaaask
    /*
    if(questionNumber!=question)){
      Alert(context: context,title: "End",desc: 'Quiz ended').show();
    }*/
    increaseQuestion();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white54,
      appBar: AppBar(
        title: Text("Quiz App"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  //error
                  //questionBank[questionNumber].questionText
                  'questionBank[questionNumber].questionText ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: FlatButton(
                color: Colors.green,
                child: Text(
                  "True",
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  checkAnswer(true);
                },
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: FlatButton(
                color: Colors.red,
                child: Text(
                  "False",
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  checkAnswer(false);
                },
              ),
            ),
          ),
          Row(
            children: [

            ],
          )
        ],
      ),
    );
  }
}
