import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:otoplus_example/src/common/base/base_notifier.dart';
import 'package:otoplus_example/src/core/error/failure.dart';
import 'package:otoplus_example/src/core/usecase/usecase.dart';
import 'package:otoplus_example/src/features/weather/domain/entities/weather_entity.dart';
import 'package:otoplus_example/src/features/weather/domain/usecases/get_weather.dart';

@injectable
class WeatherNotifier extends BaseNotifier {
  final GetWeather getWeatherUseCase;
  WeatherEntity? _weather;

  WeatherNotifier({required this.getWeatherUseCase});

  WeatherEntity? get weather => _weather;

  Future<void> fetchWeather() async {
    await handleAsync(() async {
      final result = await getWeatherUseCase(NoParams());
      return result.fold(
        (failure) => throw _mapFailureToMessage(failure),
        (weather) {
          _weather = weather;
          return weather;
        },
      );
    });
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure _:
        final serverFailure = failure as ServerFailure;
        return serverFailure.message ?? 'Sunucu Hatası';
      case CacheFailure _:
        return 'Önbellek Hatası';
      default:
        return 'Bilinmeyen bir hata oluştu.';
    }
  }
}
