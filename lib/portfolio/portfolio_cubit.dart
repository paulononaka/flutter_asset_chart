import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_asset_chart/exceptions/exceptions.dart';
import 'package:flutter_asset_chart/generated/l10n.dart';
import 'package:flutter_asset_chart/models/holding.dart';
import 'package:flutter_asset_chart/models/user.dart';
import 'package:flutter_asset_chart/portfolio/presentations/pie_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import 'portfolio_repository.dart';

part 'portfolio_cubit.freezed.dart';
part 'portfolio_state.dart';

@singleton
class PortfolioCubit extends Cubit<PortfolioState> {
  final PortfolioRepository _repository;

  PortfolioCubit(this._repository) : super(const PortfolioState.initial());

  late User user;

  Future<void> fetchUserPortfolio(BuildContext context, String userIdQuery) async {
    int userId = 0;
    try {
      userId = int.parse(userIdQuery);
    } catch (_) {
      emit(PortfolioState.error(S.of(context).searchByUserIDValidation));
      return;
    }

    try {
      emit(const PortfolioState.loading());
      user = await _repository.getUserPortfolio(userId);
      final int total = _total(user.holdings);
      final List<String> holdingTypes = _holdingTypes(context, user.holdings);
      final List<PieData> pieData = _toPieData(user.holdings, total);
      emit(PortfolioState.loaded(data: pieData, holdingTypes: holdingTypes, total: total, selectedType: 'All'));
    } on BusinessException catch (exception) {
      emit(PortfolioState.error(exception.cause));
    } catch (_) {
      emit(PortfolioState.error(S.of(context).errorFetchingPortfolio));
    }
  }

  Future<void> selectHoldingType(BuildContext context, String type) async {
    try {
      emit(const PortfolioState.loading());

      List<Holding> holdings;
      final List<String> holdingTypes = _holdingTypes(context, user.holdings);

      if (type == S.of(context).allHoldings) {
        holdings = user.holdings;
      } else {
        holdings = user.holdings.where((holding) => holding.type == type).toList();
      }

      final int total = _total(holdings);
      final List<PieData> pieData = _toPieData(holdings, total);

      emit(PortfolioState.loaded(data: pieData, holdingTypes: holdingTypes, total: total, selectedType: type));
    } on BusinessException catch (exception) {
      emit(PortfolioState.error(exception.cause));
    } catch (_) {
      emit(PortfolioState.error(S.of(context).errorFetchingPortfolio));
    }
  }

  List<PieData> _toPieData(Iterable<Holding> holdings, int total) {
    return holdings
        .map((holding) => PieData(
              holding: holding,
              percentage: (holding.value / total * 100).toStringAsFixed(2),
            ))
        .toList()
      ..sort((a, b) => a.holding.name.compareTo(b.holding.name));
  }

  int _total(Iterable<Holding> holdings) => holdings.fold(0, (sum, holding) => sum! + holding.value)!;

  List<String> _holdingTypes(BuildContext context, List<Holding> holdings) =>
      [S.of(context).allHoldings, ...holdings.map((holding) => holding.type).toSet().toList()..sort((a, b) => a.compareTo(b))];
}
