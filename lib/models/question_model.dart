class QuestionsModel{
  final int id;
  final String question;
  final String answer;
  final List<String> option;

  QuestionsModel({
    required this.id,
    required this.question,
    required this.answer,
    required this.option,
  });
}


List<QuestionsModel>simple_questions=[
  QuestionsModel(
      id: 0,
      question: "WHY ARE YOU STUDYING ENGLISH ?",
      answer: "I’m thinking of studying in England.",
      option: [
        "WHY ARE YOU STUDYING ENGLISH?",
        "So I can communicate when I travel.",
        "I love learning new languages.",
        "I’m thinking of studying in England."
      ]
  ),
  QuestionsModel(
      id: 1,
      question: "WHAT DO YOU DO IN YOUR FREE TIME?",
      answer: "I usually hang out with friends.",
      option: [
        "I don’t have any free time!",
        "I usually hang out with friends.",
        "I go running a lot.",
        "I do volunteer work."
      ]
  ),
  QuestionsModel(
      id: 2,
      question: "HOW ARE YOU FEELING?",
      answer: "Really awful.",
      option: [
        "Great! Never better.",
        "I’m all right.",
        "Like I need a vacation.",
        "Really awful."
      ]
  ),
  QuestionsModel(
      id: 3,
      question: " WHAT HAVE YOU BEEN UP TO LATELY?",
      answer: "I’ve been taking it easy.",
      option: [
        "I’ve been working a lot.",
        "Mostly studying.",
        "I’ve been taking it easy.",
        "Planning my summer vacation."
      ]
  ),
];