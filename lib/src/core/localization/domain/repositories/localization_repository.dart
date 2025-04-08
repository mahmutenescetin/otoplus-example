import 'package:flutter/material.dart';
import 'package:otoplus_example/src/core/localization/domain/entities/locale_entity.dart';

abstract class LocalizationRepository {
  List<LocaleEntity> getSupportedLocales();

  Locale getCurrentLocale();

  Future<void> setLocale(Locale locale);
}
