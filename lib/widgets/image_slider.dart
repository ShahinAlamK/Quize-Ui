import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/quiz_controller.dart';
import '../style/size_config.dart';


class ImageSlider extends StatelessWidget {
  const ImageSlider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:170,
      width:SizeConfig.width,
      child:Consumer<QuizController>(
        builder:(_,QuizController data,child){
          return CarouselSlider.builder(
              options:CarouselOptions(
                autoPlay: true,
                aspectRatio: 16/9,
                viewportFraction: 1
              ),
              itemCount: data.sliderList.length,
              itemBuilder:(_,index,datas){
            return Container(
              width:SizeConfig.width,
              decoration:BoxDecoration(
                borderRadius:BorderRadius.circular(10),
                  image:DecorationImage(
                      fit:BoxFit.cover,
                      image: NetworkImage(data.sliderList[index])),
              ),
            );
          });
        },
      ),
    );
  }
}