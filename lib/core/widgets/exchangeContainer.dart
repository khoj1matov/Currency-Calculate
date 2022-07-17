import 'package:currencyconverterapp/core/constants/color_const.dart';
import 'package:flutter/material.dart';

class ExchangeContainer {
  static Container exchangeContainer(BuildContext context, Widget child) {
    return Container(
      margin: const EdgeInsets.all(20),
      height: MediaQuery.of(context).size.height * 0.0849,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: ColorConst.kPrimaryWhite,
        borderRadius: const BorderRadius.all(
          Radius.circular(40),
        ),
        border: Border.all(
          width: 2,
          color: ColorConst.backGroundColor,
        ),
      ),
      child: child,
    );
  }
}
