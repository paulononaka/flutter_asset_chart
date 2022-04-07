import 'package:flutter_asset_chart/services/di.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;
const production = Environment('production');

@InjectableInit()
void configureDependencies(Environment env) async => $initGetIt(getIt, environment: env.name);
