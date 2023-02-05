import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:quiz/screens/questions/questions_screen.dart';
import '../controllers/quiz_controller.dart';
import '../style/app_colors.dart';
import '../style/fonts.dart';
import '../style/size_config.dart';


class Category extends StatelessWidget {
  const Category({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<QuizController>(
        builder:(_,QuizController controller, child){
      return GridView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:2,
              crossAxisSpacing:15,
              mainAxisSpacing:15,
              childAspectRatio: 1.2
          ),
          itemCount:controller.categoryList.length,
          itemBuilder:(_,index){
            return CategoryCard(
              title:controller.categoryList[index]['name'],
              logo:controller.categoryList[index]['logo'],
              opTap:(){
                Navigator.push(context,MaterialPageRoute(builder:(_)=>QuestionScreen(
                  category:controller.categoryList[index]['name'],
                )));
              },
            );
          });
    });
  }
}


class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.title,
    required this.logo,
    required this.opTap,
  }) : super(key: key);

  final String title;
  final String logo;
  final VoidCallback opTap;

  @override
  Widget build(BuildContext context) {
    SizeConfig().inti(context);
    return ClipRRect(
      borderRadius:BorderRadius.circular(10),
      child: Material(
        color:kSecondary,
        child: InkWell(
          onTap:opTap,
          child: Container(
              decoration:const BoxDecoration(
                  color:Colors.transparent,
              ),
              child: Column(
                mainAxisAlignment:MainAxisAlignment.center,
                crossAxisAlignment:CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(logo,
                  height:SizeConfig.height!*.09,
                  width: SizeConfig.width!*.09,
                  ),

                  Text(title,
                    style:mediumText.copyWith(
                        fontSize:SizeConfig.blockSizeHorizontal!*4.5),),
                ],
              )
          ),
        ),
      ),
    );
  }
}
