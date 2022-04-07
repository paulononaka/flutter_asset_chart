import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:flutter_asset_chart/services/config.dart';
import 'package:injectable/injectable.dart';

@singleton
class DioService extends DioForNative {
  DioService(Config config) {
    options = BaseOptions(baseUrl: config.host, contentType: "application/json");
  }
}
