import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:otoplus_example/src/core/error/failure.dart';
import 'package:otoplus_example/src/core/usecase/usecase.dart';
import 'package:otoplus_example/src/features/weather/domain/entities/weather_entity.dart';
import 'package:otoplus_example/src/features/weather/domain/usecases/get_weather.dart';

@injectable
class WeatherNotifier extends ChangeNotifier {
  final GetWeather getWeatherUseCase;

  WeatherNotifier({required this.getWeatherUseCase});

  bool _isLoading = false;
  WeatherEntity? _weather;
  String? _errorMessage;

  bool get isLoading => _isLoading;

  WeatherEntity? get weather => _weather;

  String? get errorMessage => _errorMessage;

  Future<void> fetchWeather() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    final failureOrWeather = await getWeatherUseCase(NoParams());

    failureOrWeather.fold(
      (failure) {
        _errorMessage = _mapFailureToMessage(failure);
      },
      (weatherData) {
        _weather = weatherData;
      },
    );

    _isLoading = false;
    notifyListeners();
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
