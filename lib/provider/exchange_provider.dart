import 'package:currencyconverterapp/core/constants/flags_const.dart';
import 'package:flutter/cupertino.dart';

class ExchangeProvider extends ChangeNotifier {
  double amount = 0.0;
  String flag = "US";
  int count = 23;
  String code = "USD";

  exchange(double dataCbPrice) {
    amount = dataCbPrice;
    notifyListeners();
  }

  onChangedFlag(int index, String countryCode) {
    count = index;
    flag = FlagList.flags[index]["flag"].toString();
    code = countryCode;
    notifyListeners();
  }
}
