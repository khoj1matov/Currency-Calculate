import 'package:currencyconverterapp/core/widgets/exchange_widget.dart';
import 'package:currencyconverterapp/core/widgets/inkwell_flag_widget.dart';
import 'package:currencyconverterapp/model/currency_model.dart';
import 'package:currencyconverterapp/provider/exchange_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FlagsAndExchange {
  static Padding flagsAndExchange(
    BuildContext context,
    List<CurrencyModel> data,
  ) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FlagWidget.flag(context, context.watch<ExchangeProvider>().flag),
          ExchangeWidget.exchange(() {
            Provider.of<ExchangeProvider>(context, listen: false).exchange(
              double.parse(
                data[Provider.of<ExchangeProvider>(context, listen: false)
                        .count]
                    .cbPrice
                    .toString(),
              ),
            );
            // context.read<ExchangeProvider>().exchange(
            //       double.parse(
            //         data[context.watch<ExchangeProvider>().count]
            //             .cbPrice
            //             .toString(),
            //       ),
            //     );
          }),
          FlagWidget.flag(context, 'UZ'),
        ],
      ),
    );
  }
}
