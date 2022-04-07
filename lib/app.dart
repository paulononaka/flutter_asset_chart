import 'package:flutter/material.dart';
import 'package:flutter_asset_chart/design_system/color_palette.dart';
import 'package:flutter_asset_chart/design_system/text_theme.dart';
import 'package:flutter_asset_chart/generated/l10n.dart';
import 'package:flutter_asset_chart/portfolio/portfolio_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: TextStyles.textTheme,
        primaryColor: ColorPalette.primaryColor,
        scaffoldBackgroundColor: ColorPalette.background,
      ),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      debugShowCheckedModeBanner: false,
      home: GetIt.I.get<PorfolioPage>(),
    );
  }
}
