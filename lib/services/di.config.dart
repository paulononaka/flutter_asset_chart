// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../portfolio/portfolio_cubit.dart' as _i6;
import '../portfolio/portfolio_page.dart' as _i7;
import '../portfolio/portfolio_repository.dart' as _i5;
import 'config.dart' as _i3;
import 'dio_service.dart' as _i4;

const String _production = 'production';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.singleton<_i3.Config>(_i3.ProdConfig(), registerFor: {_production});
  gh.singleton<_i4.DioService>(_i4.DioService(get<_i3.Config>()));
  gh.factory<_i5.PortfolioRepository>(
      () => _i5.PortfolioRepository(get<_i4.DioService>()));
  gh.singleton<_i6.PortfolioCubit>(
      _i6.PortfolioCubit(get<_i5.PortfolioRepository>()));
  gh.factory<_i7.PorfolioPage>(
      () => _i7.PorfolioPage(get<_i6.PortfolioCubit>()));
  return get;
}
