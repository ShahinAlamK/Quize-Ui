import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz/style/app_colors.dart';
import 'package:quiz/style/fonts.dart';
import 'package:quiz/style/size_config.dart';
import '../../controllers/question_controller.dart';
import '../../models/question_model.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({
    required this.category,
    Key? key}) : super(key: key);
  final String category;

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {

  PageController pageController=PageController();
  int _currentQuizIndex=0;

  Future<void> nextQuestion()async {
    if(_currentQuizIndex < simple_questions.length-1){
      _currentQuizIndex++;
      pageController.nextPage(duration: const Duration(milliseconds: 500),
          curve: Curves.fastOutSlowIn);
    }
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    QuestionController quizController=Provider.of(context);
    return Scaffold(

      appBar:AppBar(
        elevation: 0,
        backgroundColor:kPrimary,
        titleSpacing: 0,
        title:Text(widget.category),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            const SizedBox(height:15),

            Text("Question ${_currentQuizIndex+1}/${simple_questions.length}",
              style:headingText.copyWith(fontSize:SizeConfig.blockSizeHorizontal!*4),),

            const SizedBox(height: 20,),

            Expanded(child: PageView.builder(
                controller:pageController,
                onPageChanged:(value){
                  setState(() {
                    _currentQuizIndex=value;
                  });
                },
                physics:const NeverScrollableScrollPhysics(),
                scrollDirection:Axis.horizontal,
                itemCount: simple_questions.length,
                itemBuilder:(_,questionIndex){
                  final questions=simple_questions[questionIndex];

                  return ListView(
                    physics:const BouncingScrollPhysics(),
                    children: [
                      SizedBox(height:SizeConfig.blockSizeVertical!*2),
                      Text(
                        textAlign:TextAlign.center,
                        simple_questions[questionIndex].question,
                        style:mediumText.copyWith(
                            fontSize: SizeConfig.blockSizeHorizontal!*5
                        ),),

                      SizedBox(height:SizeConfig.blockSizeVertical!*5),

                      ...List.generate(questions.option.length,(optionsIndex) =>
                          QuestionsCard(
                            question: questions.option[optionsIndex],
                            index:optionsIndex,
                            onTap:(){},
                          )
                      ),
                    ],
                  );
                })),

            SizedBox(
              height:SizeConfig.height!*.06,
              width:SizeConfig.width,
              child:ElevatedButton(
                  style:ButtonStyle(
                      elevation: MaterialStateProperty.all<double>(0),
                      backgroundColor:MaterialStateProperty.all<Color>(kPrimary)
                  ),
                  onPressed:(){
                    nextQuestion();
                  },

                  child: Text(
                    quizController.currentQuizIndex < quizController.questionsList.length-1?
                    "Next":
                     "Submit",
                    style:bodyText.copyWith(fontSize:SizeConfig.blockSizeHorizontal!*5),)),
            ),

            const SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}
class QuestionsCard extends StatelessWidget {
  const QuestionsCard({
    Key? key,
    required this.question,
    required this.onTap, required this.index,
  }) : super(key: key);
  final String question;
  final int index;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: GestureDetector(
        onTap:onTap,
        child: Card(
          elevation:3,
          child: Container(
            decoration:BoxDecoration(
              color:Colors.white,
              borderRadius: BorderRadiusDirectional.circular(4),
            ),
            padding:const EdgeInsets.fromLTRB(15, 0, 10, 0),
            height:60,
            child:Row(
              children: [
                Expanded(
                  child: Text(question,
                    style:bodyText.copyWith(
                        fontSize:SizeConfig.blockSizeHorizontal!*4
                    ),),
                ),
                Container(
                  height: 20,
                  width: 20,
                  alignment:Alignment.center,
                  decoration:BoxDecoration(
                      shape:BoxShape.circle,
                      border: Border.all(
                          color:Colors.blueGrey
                      )
                  ),
                  child:const Center(child: Icon(Icons.clear,size: 15,)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


