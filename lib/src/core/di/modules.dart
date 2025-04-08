import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppModule {
  @singleton
  ValueNotifier<Locale> get localeNotifier =>
      ValueNotifier(const Locale('tr', 'TR'));
}
