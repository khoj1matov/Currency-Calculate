import 'package:currencyconverterapp/model/currency_model.dart';
import 'package:dio/dio.dart';

class CurrecyService {
  static Future<CurrencyModel> getData() async {
    Response res = await Dio().get("https://nbu.uz/uz/exchange-rates/json/");
    print(res.data);
    return res.data;
  }
}
