import 'package:flutter/material.dart';
import '../models/question_model.dart';

class QuestionController extends ChangeNotifier {

  final PageController _pageController=PageController();
  PageController get pageController=>_pageController;

  int _currentQuizIndex=0;
  int get currentQuizIndex=>_currentQuizIndex;

  final bool _isPressed=false;
  bool get isPressed=>_isPressed;


  final List<QuestionsModel>_simpleQuestion=simple_questions.map((question) =>QuestionsModel(
    id: question.id,
    question: question.question,
    answer: question.answer,
    option: question.option,
  )).toList();
  List<QuestionsModel> get questionsList=>_simpleQuestion;


  void onPageChanged(int value){
    _currentQuizIndex=value;
    notifyListeners();
  }

  Future<void> nextQuestion()async {
    if(_currentQuizIndex < questionsList.length-1){
      _currentQuizIndex++;
      notifyListeners();
      _pageController.nextPage(duration: const Duration(milliseconds: 500),
          curve: Curves.fastOutSlowIn);
    }
    notifyListeners();
  }

  @override
  void dispose() {
    _pageController.dispose();
    notifyListeners();
    super.dispose();
  }

}