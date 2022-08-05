import 'package:currencyconverterapp/core/components/text_style_comp.dart';
import 'package:currencyconverterapp/core/constants/color_const.dart';
import 'package:currencyconverterapp/core/widgets/text_field_widget.dart';
import 'package:currencyconverterapp/provider/exchange_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SumContainer {
  static Container sumContainer(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 20,
        top: 5,
        right: 20,
        bottom: 20,
      ),
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
      child: Center(
        child: Text(
          "${double.parse(TextFieldWidget.globalController) * context.watch<ExchangeProvider>().amount}",
          style: TextStyleComp.textFromFieldTS,
        ),
      ),
    );
  }
}
