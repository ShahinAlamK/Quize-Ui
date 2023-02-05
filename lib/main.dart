import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:quiz/controllers/quiz_controller.dart';

import 'controllers/question_controller.dart';
import 'screens/quiz/quiz_page.dart';

void main() {
  runApp(const MyApp());
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor:Colors.transparent,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<QuizController>(create: (_)=>QuizController()),
        ChangeNotifierProvider<QuestionController>(create: (_)=>QuestionController()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Quiz Application',
        home: QuizPage()
      ),
    );
  }
}