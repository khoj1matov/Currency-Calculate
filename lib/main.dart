import 'package:currencyconverterapp/core/constants/color_const.dart';
import 'package:currencyconverterapp/provider/exchange_provider.dart';
import 'package:currencyconverterapp/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ExchangeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Currency Converter',
      theme: ThemeData(
        scaffoldBackgroundColor: ColorConst.backGroundColor,
      ),
      onGenerateRoute: MyRoutes.instance.onGenerateRoute,
      initialRoute: "/home",
    );
  }
}
