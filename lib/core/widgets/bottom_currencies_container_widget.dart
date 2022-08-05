import 'package:currencyconverterapp/core/components/text_style_comp.dart';
import 'package:currencyconverterapp/core/constants/color_const.dart';
import 'package:currencyconverterapp/core/constants/flags_const.dart';
import 'package:currencyconverterapp/model/currency_model.dart';
import 'package:currencyconverterapp/provider/exchange_provider.dart';
import 'package:flag/flag_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomCurrenciesWidget {
  static Container bottomCurrenciesContainer(
      BuildContext context, List<CurrencyModel> data) {
    return Container(
      padding: const EdgeInsets.only(top: 5),
      height: MediaQuery.of(context).size.height * 0.4625,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: ColorConst.backGroundColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: ListView.builder(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        itemBuilder: (context, index) {
          return InkWell(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                children: [
                  Flag.fromString(
                    FlagList.flags[index]["flag"].toString(),
                    height: 50,
                    width: 50,
                    fit: BoxFit.fill,
                    borderRadius: 40,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "1 (${data[index].code!})",
                    style: TextStyleComp.appBarTitleTS,
                  ),
                  SizedBox(width: 10),
                  Text("=", style: TextStyleComp.appBarTitleTS),
                  SizedBox(width: 10),
                  Text(
                    "${data[index].cbPrice.toString()} (UZS)",
                    style: TextStyleComp.appBarTitleTS,
                  ),
                ],
              ),
            ),
            onTap: () {
              Provider.of<ExchangeProvider>(context, listen: false)
                  .onChangedFlag(index, data[index].code!);
            },
          );
        },
        itemCount: FlagList.flags.length,
      ),
    );
  }
}
