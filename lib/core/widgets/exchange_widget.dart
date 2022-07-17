import 'package:currencyconverterapp/core/components/text_style_comp.dart';
import 'package:currencyconverterapp/core/constants/color_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ExchangeWidget {
  static ElevatedButton exchange(function) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        primary: ColorConst.backGroundColor,
        fixedSize: const Size(200, 60),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SvgPicture.asset(
            "assets/icons/exchange.svg",
            height: 30,
            width: 30,
            color: ColorConst.kPrimaryWhite,
          ),
          Text(
            "Exchange",
            style: TextStyleComp.appBarTitleTS,
          ),
        ],
      ),
      onPressed: function,
    );
  }
}
