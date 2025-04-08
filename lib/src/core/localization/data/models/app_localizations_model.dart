import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:otoplus_example/src/core/localization/domain/entities/locale_entity.dart';

mixin AppLocalizationsModel {
  static const supportedLocales = [Locale('tr', 'TR'), Locale('en', 'US')];

  static const localizationsDelegates = [
    AppLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];

  static List<LocaleEntity> getSupportedLocaleEntities() {
    return supportedLocales
        .map(
          (locale) => LocaleEntity(
            languageCode: locale.languageCode,
            countryCode: locale.countryCode ?? '',
          ),
        )
        .toList();
  }
}
