import 'package:flag/flag.dart';
import 'package:flutter/material.dart';

class FlagWidget {
  static Container flag(BuildContext context, String flag) {
    return Container(
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
    );
  }
}
