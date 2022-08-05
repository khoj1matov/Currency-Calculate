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
      padding: const EdgeInsets.only(left: 15, right: 10, top: 2),
      height: MediaQuery.of(context).size.height * 0.4155,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: ColorConst.backGroundColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: ListView.builder(
        itemBuilder: (context, index) {
          return InkWell(
            child: ListTile(
              contentPadding: const EdgeInsets.all(10),
              leading: Flag.fromString(
                FlagList.flags[index]["flag"].toString(),
                height: 50,
                width: 50,
                fit: BoxFit.fill,
                borderRadius: 40,
              ),
              title: Text(
                data[index].code.toString(),
                style: TextStyleComp.appBarTitleTS,
              ),
              trailing: Text(
                data[index].cbPrice.toString(),
                style: TextStyleComp.appBarTitleTS,
              ),
            ),
            onTap: () {
              Provider.of<ExchangeProvider>(context, listen: false)
                  .onChangedFlag(index);
            },
          );
        },
        itemCount: FlagList.flags.length,
      ),
    );
  }
}
