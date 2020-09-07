import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show SynchronousFuture;
import 'WiktorLocalizations.dart';

class WiktorLocalizationsDelegate extends LocalizationsDelegate<WiktorLocalizations> {
  const WiktorLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'es', 'hi', 'pl'].contains(locale.languageCode);

  @override
  Future<WiktorLocalizations> load(Locale locale) {
    // Returning a SynchronousFuture here because an async "load" operation
    // isn't needed to produce an instance of DemoLocalizations.
    return SynchronousFuture<WiktorLocalizations>(WiktorLocalizations(locale));
  }

  @override
  bool shouldReload(WiktorLocalizationsDelegate old) => false;
}