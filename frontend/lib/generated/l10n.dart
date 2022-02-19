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

  /// `Tinder`
  String get app_name {
    return Intl.message(
      'Tinder',
      name: 'app_name',
      desc: '',
      args: [],
    );
  }

  /// `Hello Stranger, looks like you need to sign in into your account...\n Pls, follow button below.`
  String get welcome_ui_string {
    return Intl.message(
      'Hello Stranger, looks like you need to sign in into your account...\n Pls, follow button below.',
      name: 'welcome_ui_string',
      desc: '',
      args: [],
    );
  }

  /// `Sign In with Google`
  String get sign_in_google_ui_string {
    return Intl.message(
      'Sign In with Google',
      name: 'sign_in_google_ui_string',
      desc: '',
      args: [],
    );
  }

  /// `Sign In Anonymously`
  String get sign_in_anonymous_ui_string {
    return Intl.message(
      'Sign In Anonymously',
      name: 'sign_in_anonymous_ui_string',
      desc: '',
      args: [],
    );
  }

  /// `Your Chats`
  String get your_chats_ui_string {
    return Intl.message(
      'Your Chats',
      name: 'your_chats_ui_string',
      desc: '',
      args: [],
    );
  }

  /// `Unfortunately you do not have any chats yet.`
  String get there_is_no_chats_ui_string {
    return Intl.message(
      'Unfortunately you do not have any chats yet.',
      name: 'there_is_no_chats_ui_string',
      desc: '',
      args: [],
    );
  }

  /// `Nick: {nick}`
  String nick_ui_string(Object nick) {
    return Intl.message(
      'Nick: $nick',
      name: 'nick_ui_string',
      desc: '',
      args: [nick],
    );
  }

  /// `Id: {id}`
  String id_ui_string(Object id) {
    return Intl.message(
      'Id: $id',
      name: 'id_ui_string',
      desc: '',
      args: [id],
    );
  }

  /// `Open account`
  String get open_account {
    return Intl.message(
      'Open account',
      name: 'open_account',
      desc: '',
      args: [],
    );
  }

  /// `Closed account`
  String get closed_account {
    return Intl.message(
      'Closed account',
      name: 'closed_account',
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
