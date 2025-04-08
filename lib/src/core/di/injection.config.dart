// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
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
import '../network/api_client.dart' as _i557;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt $initGetIt(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(getIt, environment, environmentFilter);
  gh.lazySingleton<_i557.ApiClient>(() => _i557.ApiClient());
  gh.lazySingleton<_i235.WeatherRemoteDataSource>(
    () => _i235.WeatherRemoteDataSourceImpl(gh<_i557.ApiClient>()),
  );
  gh.lazySingleton<_i956.WeatherRepository>(
    () => _i231.WeatherRepositoryImpl(
      remoteDataSource: gh<_i235.WeatherRemoteDataSource>(),
    ),
  );
  gh.lazySingleton<_i161.GetWeather>(
    () => _i161.GetWeather(gh<_i956.WeatherRepository>()),
  );
  gh.factory<_i817.WeatherNotifier>(
    () => _i817.WeatherNotifier(getWeatherUseCase: gh<_i161.GetWeather>()),
  );
  return getIt;
}
