import 'package:currencyconverterapp/core/constants/color_const.dart';
import 'package:flutter/cupertino.dart';

class TextStyleComp {
  static get appBarTitleTS => TextStyle(
        color: ColorConst.kPrimaryWhite,
        fontSize: 25,
        fontWeight: FontWeight.bold,
      );
  static get textFromFieldTS => TextStyle(
        color: ColorConst.backGroundColor,
        fontSize: 25,
        fontWeight: FontWeight.bold,
      );

  static get dataTitleTitleTS => TextStyle(
        color: ColorConst.kPrimaryWhite,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      );

  static get enterTheAmount => TextStyle(
        color: ColorConst.backGroundColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      );

  static get noConnection => TextStyle(
        color: ColorConst.backGroundColor,
        fontSize: 25,
        fontWeight: FontWeight.bold,
      );

  static get noConnectionMakeSure => TextStyle(
        color: ColorConst.backGroundColor_15,
        fontSize: 15,
        fontWeight: FontWeight.bold,
      );
}
