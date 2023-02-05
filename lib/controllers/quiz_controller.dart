import 'package:flutter/material.dart';

class QuizController extends ChangeNotifier {
  GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

  void endDrawerOpen() {
    globalKey.currentState!.openEndDrawer();
  }

  List<String> get sliderList => [
        "https://s3.envato.com/files/229749793/quizgame_bg.jpg",
      ];

  List get categoryList => [
        {
          "name": "General",
          "logo": "asset/icons/BOOKS.svg",
        },
        {
          "name": "Bangla",
          "logo": "asset/icons/OPEN BOOK.svg",
        },
        {
          "name": "English",
          "logo": "asset/icons/Q AND A.svg",
        },
        {
          "name": "Math",
          "logo": "asset/icons/CHALKBOARD.svg",
        },
        {
          "name": "Science",
          "logo": "asset/icons/CHEMISTRY.svg",
        },
        {
          "name": "Sport's",
          "logo": "asset/icons/SPORT.svg",
        },
      ];
}
