import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/quiz.dart';
import 'result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  var _questions = [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 12},
        {'text': 'Green', 'score': 5},
        {'text': 'White', 'score': 2}
      ]
    },
    {
      'questionText': 'What\'s your favorite city?',
      'answers': [
        {'text': 'Ha Noi', 'score': 3},
        {'text': 'Dong Hoi', 'score': 4},
        {'text': 'Da Nang', 'score': 5},
        {'text': 'Ho Chi Minh', 'score': 6}
      ]
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Rabit', 'score': 3},
        {'text': 'Snake', 'score': 4},
        {'text': 'Elephant', 'score': 5},
        {'text': 'Dophin', 'score': 6}
      ]
    }
  ];
  var _questionIndex = 0;
  var _totalScore = 0;
  void _answerQuestion(int score) {
    setState(() {
      _questionIndex++;
      _totalScore += score;
    });
    if (_questionIndex < _questions.length) {
      print('We have more question');
    } else {
      print('No more questions');
    }
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('My first App'),
          ),
          body: _questionIndex < _questions.length
              ? Quiz(_answerQuestion, _questions, _questionIndex)
              : Result(_totalScore)),
    );
  }
}
