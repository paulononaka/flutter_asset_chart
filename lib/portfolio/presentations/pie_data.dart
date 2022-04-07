import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_asset_chart/models/holding.dart';

class PieData {
  final Holding holding;
  final String percentage;
  final Color color = Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);

  PieData({required this.holding, required this.percentage});
}
