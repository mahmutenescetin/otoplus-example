import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import 'package:otoplus_example/src/core/localization/domain/entities/locale_entity.dart';
import 'package:otoplus_example/src/core/localization/domain/repositories/localization_repository.dart';

@singleton
class LocaleProvider extends ChangeNotifier {
  final LocalizationRepository _repository;
  late Locale _locale;

  LocaleProvider(this._repository) {
    _locale = _repository.getCurrentLocale();
  }

  Locale get locale => _locale;

  List<LocaleEntity> get supportedLocales => _repository.getSupportedLocales();

  Future<void> setLocale(Locale locale) async {
    if (_locale != locale) {
      _locale = locale;
      await _repository.setLocale(locale);
      notifyListeners();
    }
  }
}
