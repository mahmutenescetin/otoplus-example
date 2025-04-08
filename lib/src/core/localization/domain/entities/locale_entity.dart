import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

class LocaleEntity extends Equatable {
  final String languageCode;
  final String countryCode;

  const LocaleEntity({
    required this.languageCode,
    required this.countryCode,
  });

  Locale toLocale() => Locale(languageCode, countryCode);

  @override
  List<Object?> get props => [languageCode, countryCode];
}
