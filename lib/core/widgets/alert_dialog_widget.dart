import 'package:currencyconverterapp/core/components/text_style_comp.dart';
import 'package:flag/flag.dart';
import 'package:flutter/material.dart';

class AlertDialogWidget {
  static alertDialog(context, String currency, String flag) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      title: Text(
        "Select Flag",
        style: TextStyleComp.textFromFieldTS,
      ),
      content: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.5,
          child: Column(
            children: [
              InkWell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      currency,
                      style: TextStyleComp.textFromFieldTS,
                    ),
                    Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        border: Border.all(width: 2),
                      ),
                      child: Flag.fromString(
                        flag,
                        height: 50,
                        width: 60,
                        fit: BoxFit.fill,
                        borderRadius: 40,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
