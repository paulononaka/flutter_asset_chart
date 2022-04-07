import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_asset_chart/design_system/color_palette.dart';
import 'package:flutter_asset_chart/design_system/components/asset_dash_scaffold.dart';
import 'package:flutter_asset_chart/design_system/images.dart';
import 'package:flutter_asset_chart/design_system/sizes.dart';
import 'package:flutter_asset_chart/generated/l10n.dart';
import 'package:flutter_asset_chart/portfolio/components/portfolio_chart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'portfolio_cubit.dart';

@injectable
class PorfolioPage extends StatelessWidget {
  final PortfolioCubit cubit;

  const PorfolioPage(this.cubit);

  @override
  Widget build(BuildContext context) {
    return AssetDashScaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(Sizes.defaultPadding),
              child: Text(S.of(context).appTitle, style: Theme.of(context).textTheme.headline1),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: Sizes.defaultPadding),
              decoration: BoxDecoration(
                borderRadius: Sizes.defaultBorderRadius,
                color: Colors.white,
              ),
              child: TextField(
                autocorrect: false,
                textInputAction: TextInputAction.go,
                onSubmitted: (String query) => cubit.fetchUserPortfolio(context, query),
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  hintText: S.of(context).searchByUserID,
                  icon: const Icon(
                    CupertinoIcons.search,
                    color: ColorPalette.primaryColor,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            BlocConsumer<PortfolioCubit, PortfolioState>(
              bloc: cubit,
              listener: (context, state) {
                state.maybeWhen(
                  error: (message) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message), backgroundColor: ColorPalette.primaryColor)),
                  orElse: () {},
                );
              },
              builder: (context, state) {
                return state.maybeWhen(
                  loading: () => const Expanded(child: Center(child: CircularProgressIndicator(color: ColorPalette.primaryColor))),
                  loaded: (data, holdingTypes, total, selectedType) => Expanded(
                    child: PortfolioChart(
                      cubit: cubit,
                      data: data,
                      holdingTypes: holdingTypes,
                      total: total,
                      selectedType: selectedType,
                    ),
                  ),
                  orElse: () => Expanded(child: Center(child: Images.empty)),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
