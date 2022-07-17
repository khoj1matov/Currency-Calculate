import 'package:currencyconverterapp/core/components/text_style_comp.dart';
import 'package:currencyconverterapp/core/constants/color_const.dart';
import 'package:currencyconverterapp/core/constants/flags_const.dart';
import 'package:currencyconverterapp/core/widgets/container_widget.dart';
import 'package:currencyconverterapp/core/widgets/exchange_widget.dart';
import 'package:currencyconverterapp/core/widgets/inkwell_flag_widget.dart';
import 'package:currencyconverterapp/core/widgets/text_field_widget.dart';
import 'package:currencyconverterapp/model/currency_model.dart';
import 'package:currencyconverterapp/service/currency_service.dart';
import 'package:currencyconverterapp/views/home/base_view.dart';
import 'package:flag/flag.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  double amount = 0.0;
  int count = 23;
  String onChangedFlag = "US";
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModal: HomeView,
      onPageBuilder: (context, widget) {
        return Scaffold(
          body: FutureBuilder(
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
                var data = snapshot.data;
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 40, bottom: 20, left: 20, right: 20),
                        child: Text(
                          "Currency Converter",
                          style: TextStyleComp.appBarTitleTS,
                        ),
                      ),
                      ContainerWidget.container(
                        context,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 25, top: 20),
                              child: Text(
                                "Enter The Amount",
                                style: TextStyleComp.enterTheAmount,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, top: 5, right: 20, bottom: 20),
                              child: TextFieldWidget.textFromField(
                                context,
                                _controller,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  FlagWidget.flag(context, onChangedFlag),
                                  ExchangeWidget.exchange(() {
                                    exchange(
                                      double.parse(
                                        data![count].cbPrice.toString(),
                                      ),
                                    );
                                  }),
                                  FlagWidget.flag(context, 'UZ'),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 25),
                              child: Text(
                                "Amount",
                                style: TextStyleComp.enterTheAmount,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                  left: 20, top: 5, right: 20, bottom: 20),
                              height:
                                  MediaQuery.of(context).size.height * 0.0849,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: ColorConst.kPrimaryWhite,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(40),
                                ),
                                border: Border.all(
                                  width: 2,
                                  color: ColorConst.backGroundColor,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  "${double.parse(TextFieldWidget.globalController) * amount}",
                                  style: TextStyleComp.textFromFieldTS,
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(
                                  left: 15, right: 10, top: 2),
                              height:
                                  MediaQuery.of(context).size.height * 0.4155,
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
                                        FlagList.flags[index]["flag"]
                                            .toString(),
                                        height: 50,
                                        width: 50,
                                        fit: BoxFit.fill,
                                        borderRadius: 40,
                                      ),
                                      title: Text(
                                        data![index].code.toString(),
                                        style: TextStyleComp.appBarTitleTS,
                                      ),
                                      trailing: Text(
                                        data[index].cbPrice.toString(),
                                        style: TextStyleComp.appBarTitleTS,
                                      ),
                                    ),
                                    onTap: () {
                                      setState(() {
                                        count = index;
                                        onChangedFlag = FlagList.flags[index]
                                                ["flag"]
                                            .toString();
                                      });
                                    },
                                  );
                                },
                                itemCount: FlagList.flags.length,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }
            }),
          ),
        );
      },
    );
  }

  exchange(double dataCbPrice) {
    setState(() {
      amount = dataCbPrice;
    });
  }
}
