import 'package:flutter/material.dart';
import 'package:quiz/style/fonts.dart';
import '../../style/size_config.dart';
import '../../widgets/categories.dart';
import '../../widgets/image_slider.dart';

class QuizBody extends StatefulWidget {
  const QuizBody({
    Key? key,
  }) : super(key: key);

  @override
  State<QuizBody> createState() => _QuizBodyState();
}

class _QuizBodyState extends State<QuizBody> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().inti(context);
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: [
          const SizedBox(height: 10),
          const ImageSlider(),
          const SizedBox(height: 20),
          Text(
            "Categories",
            style: headingText.copyWith(
                fontSize: SizeConfig.blockSizeHorizontal! * 5),
          ),
          const SizedBox(height: 8),
          const Category(),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
