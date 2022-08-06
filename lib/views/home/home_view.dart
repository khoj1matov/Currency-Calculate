import 'package:currencyconverterapp/core/components/text_style_comp.dart';
import 'package:currencyconverterapp/core/constants/color_const.dart';
import 'package:currencyconverterapp/core/widgets/amount_title_widget.dart';
import 'package:currencyconverterapp/core/widgets/bottom_currencies_container_widget.dart';
import 'package:currencyconverterapp/core/widgets/container_widget.dart';
import 'package:currencyconverterapp/core/widgets/flags_and_exchange_widget.dart';
import 'package:currencyconverterapp/core/widgets/sum_container_widget.dart';
import 'package:currencyconverterapp/core/widgets/text_field_widget.dart';
import 'package:currencyconverterapp/core/widgets/title_widget.dart';
import 'package:currencyconverterapp/model/currency_model.dart';
import 'package:currencyconverterapp/service/currency_service.dart';
import 'package:currencyconverterapp/views/home/base_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
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
                      TitleWidget.title("Currency Calculator"),
                      ContainerWidget.container(
                        context,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AmountTitleWidget.enterAmount(),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 20,
                                top: 5,
                                right: 20,
                                bottom: 20,
                              ),
                              child: TextFieldWidget.textFromField(
                                context,
                                _controller,
                              ),
                            ),
                            FlagsAndExchange.flagsAndExchange(context, data!),
                            AmountTitleWidget.sumAmount(),
                            SumContainer.sumContainer(context),
                            BottomCurrenciesWidget.bottomCurrenciesContainer(
                              context,
                              data,
                            )
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
}
