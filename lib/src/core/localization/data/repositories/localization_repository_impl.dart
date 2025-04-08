import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:otoplus_example/src/core/localization/domain/entities/locale_entity.dart';
import 'package:otoplus_example/src/core/localization/domain/repositories/localization_repository.dart';
import 'package:otoplus_example/src/core/localization/data/models/app_localizations_model.dart';

@Injectable(as: LocalizationRepository)
class LocalizationRepositoryImpl implements LocalizationRepository {
  final ValueNotifier<Locale> _localeNotifier;

  LocalizationRepositoryImpl(this._localeNotifier);

  @override
  List<LocaleEntity> getSupportedLocales() {
    return AppLocalizationsModel.getSupportedLocaleEntities();
  }

  @override
  Locale getCurrentLocale() {
    return _localeNotifier.value;
  }

  @override
  Future<void> setLocale(Locale locale) async {
    _localeNotifier.value = locale;
  }
}
