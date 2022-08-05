import 'package:currencyconverterapp/core/components/text_style_comp.dart';
import 'package:flutter/material.dart';

class AmountTitleWidget {
  static Padding enterAmount() {
    return Padding(
      padding: const EdgeInsets.only(left: 25, top: 20),
      child: Text(
        "Enter The Amount",
        style: TextStyleComp.enterTheAmount,
      ),
    );
  }

  static Padding sumAmount() {
    return Padding(
      padding: const EdgeInsets.only(left: 25),
      child: Text(
        "Amount",
        style: TextStyleComp.enterTheAmount,
      ),
    );
  }
}
