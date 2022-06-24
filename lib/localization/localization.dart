import 'dart:async';
import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Localization {
  Localization(this.locale);

  final Locale locale;

  static Localization? of(BuildContext context) {
    return Localizations.of<Localization>(context, Localization);
  }

  late Map<String, String> _sentences;

  Future<bool> load() async {
    String data = await rootBundle.loadString('lang/${locale.languageCode}.json');

    Map<String, dynamic> _result = json.decode(data);

    _sentences = {};

    _result.forEach((String key, dynamic value) {
      _sentences[key] = value.toString();
    });

    return true;
  }

  String? getString(String key) {
    return _sentences[key];
  }

  static const LocalizationsDelegate <Localization> delegate = _WebLocalizationDelegate();

}


class _WebLocalizationDelegate extends LocalizationsDelegate<Localization> {

  const _WebLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => ['sv', 'en'].contains(locale.languageCode);

  @override
  Future<Localization> load(Locale locale) async {
    Localization localizations = Localization(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(LocalizationsDelegate<Localization> old) => false;
}
