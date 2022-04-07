import 'package:dio/dio.dart';
import 'package:flutter_asset_chart/exceptions/exceptions.dart';
import 'package:flutter_asset_chart/generated/l10n.dart';
import 'package:flutter_asset_chart/models/user.dart';
import 'package:flutter_asset_chart/services/dio_service.dart';
import 'package:injectable/injectable.dart';

@injectable
class PortfolioRepository {
  final DioService client;

  PortfolioRepository(this.client);

  Future<User> getUserPortfolio(int userId) async {
    try {
      final result = await client.get('portfolio/$userId');
      return User.fromJson(result.data);
    } on DioError catch (exception) {
      if (exception.response?.statusCode == 404) {
        throw BusinessException(cause: S.current.userNotFound);
      } else {
        rethrow;
      }
    }
  }
}
