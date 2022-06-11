import 'package:currencyconverterapp/components/text_style_comp.dart';
import 'package:currencyconverterapp/constants/color_const.dart';
import 'package:currencyconverterapp/model/currency_model.dart';
import 'package:currencyconverterapp/service/currency_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: CurrecyService.getData(),
        builder: ((context, AsyncSnapshot<CurrencyModel> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator.adaptive(
                backgroundColor: ColorConst.kPrimaryWhite,
                valueColor: const AlwaysStoppedAnimation<Color>(Color(0XFF8E8CAC)),
              ),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text("Error"),
            );
          } else {
            return Container();
          }
        }),
      ),
    );

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
}

// SingleChildScrollView(
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(
//                   top: 40, bottom: 20, left: 20, right: 20),
//               child: Text(
//                 "Currency Converter",
//                 style: TextStyleComp.appBarTitleTS,
//               ),
//             ),
//             Container(
//               height: MediaQuery.of(context).size.height * 0.89,
//               width: MediaQuery.of(context).size.width,
//               decoration: BoxDecoration(
//                 color: ColorConst.kPrimaryWhite,
//                 borderRadius: const BorderRadius.only(
//                   topLeft: Radius.circular(40),
//                   topRight: Radius.circular(40),
//                 ),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(20),
//                 child: Column(
//                   children: [
//                     _textFromField(_controller),
//                     const SizedBox(height: 20),
//                     _textFromField(_controller),
//                     const SizedBox(height: 20),
//                     ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         elevation: 0,
//                         primary: ColorConst.backGroundColor,
//                         fixedSize: const Size(210, 60),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(40),
//                         ),
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           SvgPicture.asset(
//                             "assets/icons/exchange.svg",
//                             height: 30,
//                             width: 30,
//                             color: ColorConst.kPrimaryWhite,
//                           ),
//                           Text(
//                             "Exchange",
//                             style: TextStyleComp.appBarTitleTS,
//                           ),
//                         ],
//                       ),
//                       onPressed: () {},
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),