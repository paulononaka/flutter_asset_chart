// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `AssetDash Portfolio Tracker`
  String get appTitle {
    return Intl.message(
      'AssetDash Portfolio Tracker',
      name: 'appTitle',
      desc: '',
      args: [],
    );
  }

  /// `Portfolio Holdings`
  String get portfolioHoldings {
    return Intl.message(
      'Portfolio Holdings',
      name: 'portfolioHoldings',
      desc: '',
      args: [],
    );
  }

  /// `Porfolio Chart`
  String get porfolioChart {
    return Intl.message(
      'Porfolio Chart',
      name: 'porfolioChart',
      desc: '',
      args: [],
    );
  }

  /// `Search by User ID`
  String get searchByUserID {
    return Intl.message(
      'Search by User ID',
      name: 'searchByUserID',
      desc: '',
      args: [],
    );
  }

  /// `User ID should be a number`
  String get searchByUserIDValidation {
    return Intl.message(
      'User ID should be a number',
      name: 'searchByUserIDValidation',
      desc: '',
      args: [],
    );
  }

  /// `Error fetching portfolio :(`
  String get errorFetchingPortfolio {
    return Intl.message(
      'Error fetching portfolio :(',
      name: 'errorFetchingPortfolio',
      desc: '',
      args: [],
    );
  }

  /// `User not found`
  String get userNotFound {
    return Intl.message(
      'User not found',
      name: 'userNotFound',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get allHoldings {
    return Intl.message(
      'All',
      name: 'allHoldings',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
