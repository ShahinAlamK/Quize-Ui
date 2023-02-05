import 'package:flutter/cupertino.dart';

class SizeConfig{
  static MediaQueryData? _queryData;
  static double? height;
  static double? width;
  static double? blockSizeHorizontal;
  static double? blockSizeVertical;

  inti(BuildContext context){
    _queryData=MediaQuery.of(context);
    height=_queryData!.size.height;
    width=_queryData!.size.width;
    blockSizeHorizontal=width!/100;
    blockSizeVertical=height!/100;
  }
}