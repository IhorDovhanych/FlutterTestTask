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

  /// `Flutter task`
  String get app_name {
    return Intl.message(
      'Flutter task',
      name: 'app_name',
      desc: 'Application name',
      args: [],
    );
  }

  /// `Count`
  String get count {
    return Intl.message(
      'Count',
      name: 'count',
      desc: 'Count title',
      args: [],
    );
  }

  /// `Home page`
  String get home_page {
    return Intl.message(
      'Home page',
      name: 'home_page',
      desc: 'AppBar title for home_page',
      args: [],
    );
  }

  /// `Set valid API base URL in order to continue.`
  String get set_valid_API_base {
    return Intl.message(
      'Set valid API base URL in order to continue.',
      name: 'set_valid_API_base',
      desc: 'TextField title',
      args: [],
    );
  }

  /// `URL`
  String get url {
    return Intl.message(
      'URL',
      name: 'url',
      desc: 'URL text',
      args: [],
    );
  }

  /// `Start counting process`
  String get start_counting_process {
    return Intl.message(
      'Start counting process',
      name: 'start_counting_process',
      desc: 'home_page button text',
      args: [],
    );
  }

  /// `Process page`
  String get process_page {
    return Intl.message(
      'Process page',
      name: 'process_page',
      desc: 'AppBar title for process_page',
      args: [],
    );
  }

  /// `All calculations has finished, you can send your results to server`
  String get all_calculations_has_finished {
    return Intl.message(
      'All calculations has finished, you can send your results to server',
      name: 'all_calculations_has_finished',
      desc: 'progress_page text after loading finished',
      args: [],
    );
  }

  /// `Send results to server`
  String get send_results_to_server {
    return Intl.message(
      'Send results to server',
      name: 'send_results_to_server',
      desc: 'progress_page button text',
      args: [],
    );
  }

  /// `Result list page`
  String get grid_list_page {
    return Intl.message(
      'Result list page',
      name: 'grid_list_page',
      desc: 'AppBar title for grid_list_page',
      args: [],
    );
  }

  /// `Preview page`
  String get grid_detail_page {
    return Intl.message(
      'Preview page',
      name: 'grid_detail_page',
      desc: 'AppBar title for grid_detail_page',
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
