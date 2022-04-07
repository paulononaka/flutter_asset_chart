part of 'portfolio_cubit.dart';

@freezed
class PortfolioState with _$PortfolioState {
  const factory PortfolioState.initial() = _Initial;
  const factory PortfolioState.loading() = _Loading;
  const factory PortfolioState.error(String message) = _Error;
  const factory PortfolioState.loaded({
    required List<PieData> data,
    required List<String> holdingTypes,
    required int total,
    required String selectedType,
  }) = _Loaded;
}
