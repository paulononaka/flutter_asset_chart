import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MoneyFormatter {
  final BuildContext context;

  MoneyFormatter(this.context);

  String symbol() {
    var format = NumberFormat.simpleCurrency(locale: Platform.localeName);
    return format.currencySymbol;
  }

  String value(num value) {
    num newValue = value * 0.01;
    var numberFormat = NumberFormat("#,##0.00", "en_US");
    return numberFormat.format(newValue);
  }

  String format(num string) {
    return "${symbol()}${value(string)}";
  }
}
