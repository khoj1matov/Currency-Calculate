import 'package:currencyconverterapp/core/components/text_style_comp.dart';
import 'package:currencyconverterapp/core/constants/color_const.dart';
import 'package:flutter/material.dart';

class TextFieldWidget {
  static String globalController = "0.0";
  static TextFormField textFromField(
    BuildContext context,
    TextEditingController controller,
  ) {
    return TextFormField(
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
      style: TextStyleComp.textFromFieldTS,
      controller: controller,
      cursorColor: ColorConst.backGroundColor,
      decoration: InputDecoration(
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
