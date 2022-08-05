import 'package:currencyconverterapp/core/constants/flags_const.dart';
import 'package:flutter/cupertino.dart';

class ExchangeProvider extends ChangeNotifier {
  double amount = 0.0;
  String flag = "US";
  int count = 23;

  exchange(double dataCbPrice) {
    amount = dataCbPrice;
    notifyListeners();
  }


  onChangedFlag(int index) {
    count = index;
    flag = FlagList.flags[index]["flag"].toString();
    notifyListeners();
  }
}
