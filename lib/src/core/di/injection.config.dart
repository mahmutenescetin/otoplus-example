// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:ui' as _i264;

import 'package:flutter/material.dart' as _i409;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/weather/data/datasources/remote/weather_remote_data_source.dart'
    as _i235;
import '../../features/weather/data/repositories/weather_repository_impl.dart'
    as _i231;
import '../../features/weather/domain/repositories/weather_repository.dart'
    as _i956;
import '../../features/weather/domain/usecases/get_weather.dart' as _i161;
import '../../features/weather/presentation/provider/weather_notifier.dart'
    as _i817;
import '../localization/data/repositories/localization_repository_impl.dart'
    as _i1062;
import '../localization/domain/repositories/localization_repository.dart'
    as _i249;
import '../localization/presentation/provider/locale_provider.dart' as _i926;
import '../network/api_client.dart' as _i557;
import 'modules.dart' as _i738;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt $initGetIt(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(getIt, environment, environmentFilter);
  final appModule = _$AppModule();
  gh.singleton<_i409.ValueNotifier<_i264.Locale>>(
    () => appModule.localeNotifier,
  );
  gh.lazySingleton<_i557.ApiClient>(() => _i557.ApiClient());
  gh.factory<_i249.LocalizationRepository>(
    () => _i1062.LocalizationRepositoryImpl(
      gh<_i409.ValueNotifier<_i264.Locale>>(),
    ),
  );
  gh.singleton<_i926.LocaleProvider>(
    () => _i926.LocaleProvider(gh<_i249.LocalizationRepository>()),
  );
  gh.lazySingleton<_i235.WeatherRemoteDataSource>(
    () => _i235.WeatherRemoteDataSourceImpl(gh<_i557.ApiClient>()),
  );
  gh.lazySingleton<_i956.WeatherRepository>(
    () => _i231.WeatherRepositoryImpl(gh<_i235.WeatherRemoteDataSource>()),
  );
  gh.lazySingleton<_i161.GetWeather>(
    () => _i161.GetWeather(gh<_i956.WeatherRepository>()),
  );
  gh.factory<_i817.WeatherNotifier>(
    () => _i817.WeatherNotifier(getWeatherUseCase: gh<_i161.GetWeather>()),
  );
  return getIt;
}

class _$AppModule extends _i738.AppModule {}
