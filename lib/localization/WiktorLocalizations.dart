import 'package:flutter/material.dart';

class WiktorLocalizations {
  WiktorLocalizations(this.locale);

  final Locale locale;

  static WiktorLocalizations of(BuildContext context) {
    return Localizations.of<WiktorLocalizations>(context, WiktorLocalizations);
  }

  static Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'title': 'Locale in English',
    },
    'es': {
      'title': 'Local en españa',
    },
    'hi': {
      'title': 'लोकेल हिंदी में',
    },
    'pl': {
      'title': 'Polska lokalizacja',
    },
  };

  String get title {
    return _localizedValues[locale.languageCode]['title'];
  }
}