import 'package:currencyconverterapp/core/components/text_style_comp.dart';
import 'package:currencyconverterapp/core/constants/color_const.dart';
import 'package:currencyconverterapp/model/currency_model.dart';
import 'package:currencyconverterapp/service/currency_service.dart';
import 'package:flutter/material.dart';

class FutureBuilderWidget {
  static FutureBuilder<List<CurrencyModel>> futureBuilder(Widget widget) {
    return FutureBuilder(
      future: CurrencyService.getData(),
      builder: ((context, AsyncSnapshot<List<CurrencyModel>> snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator.adaptive(
              backgroundColor: ColorConst.kPrimaryWhite,
              valueColor: const AlwaysStoppedAnimation<Color>(
                Color(0XFF8E8CAC),
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text(
              "Error",
              style: TextStyleComp.appBarTitleTS,
            ),
          );
        } else {
          return widget;
        }
      }),
    );
  }
}
