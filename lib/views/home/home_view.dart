import 'package:currencyconverterapp/components/text_style_comp.dart';
import 'package:currencyconverterapp/constants/color_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
            Container(
              height: MediaQuery.of(context).size.height * 0.89,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: ColorConst.kPrimaryWhite,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    _textFromField(_controller),
                    SvgPicture.asset("assets/icons/exchange.svg"),
                    _textFromField(_controller),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextFormField _textFromField(TextEditingController controller) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide(color: ColorConst.backGroundColor, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide(color: ColorConst.backGroundColor, width: 2),
        ),
      ),
    );
  }
}
