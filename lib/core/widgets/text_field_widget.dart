import 'package:currencyconverterapp/core/components/text_style_comp.dart';
import 'package:currencyconverterapp/core/constants/color_const.dart';
import 'package:currencyconverterapp/provider/exchange_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TextFieldWidget {
  static String globalController = "0.0";
  static TextFormField textFromField(
    BuildContext context,
    TextEditingController controller,
  ) {
    return TextFormField(
      keyboardType: TextInputType.number,
      style: TextStyleComp.textFromFieldTS,
      controller: controller,
      cursorColor: ColorConst.backGroundColor,
      decoration: InputDecoration(
        hintText: "0.0",
        hintStyle: TextStyleComp.textFromFieldTS,
        suffixIcon: Padding(
          padding: const EdgeInsets.only(top: 15, bottom: 15, right: 20),
          child: Text(
            context.watch<ExchangeProvider>().code,
            style: TextStyleComp.textFromFieldTS,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide(color: ColorConst.backGroundColor, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide(color: ColorConst.backGroundColor, width: 2),
        ),
      ),
      onChanged: (v) {
        globalController = controller.text;
      },
    );
  }
}
