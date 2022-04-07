import 'package:flutter_asset_chart/services/di.dart';
import 'package:injectable/injectable.dart';

abstract class Config {
  String get host;
}

@production
@Singleton(as: Config)
class ProdConfig implements Config {
  @override
  String host = 'https://624760d3229b222a3fcc6155.mockapi.io/api/v1/';
}
