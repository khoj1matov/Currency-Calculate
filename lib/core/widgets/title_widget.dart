import 'package:currencyconverterapp/core/components/text_style_comp.dart';
import 'package:flutter/material.dart';

class TitleWidget {
  static Padding title(String text) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 40,
        left: 20,
        right: 20,
        bottom: 20,
      ),
      child: Text(
        text,
        style: TextStyleComp.appBarTitleTS,
      ),
    );
  }
}
