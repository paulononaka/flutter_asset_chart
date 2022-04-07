import 'package:flutter/material.dart';
import 'package:flutter_asset_chart/app.dart';
import 'package:flutter_asset_chart/services/di.dart';

void main() {
  configureDependencies(production);
  runApp(const App());
}
