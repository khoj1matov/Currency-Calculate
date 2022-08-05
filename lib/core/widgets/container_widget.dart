import 'package:currencyconverterapp/core/constants/color_const.dart';
import 'package:flutter/material.dart';

class ContainerWidget {
  static Container container(BuildContext context, Widget child) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.89423,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: ColorConst.kPrimaryWhite,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: child,
    );
  }
}
