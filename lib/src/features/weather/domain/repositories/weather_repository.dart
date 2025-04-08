import 'package:dartz/dartz.dart';
import 'package:otoplus_example/src/core/error/failure.dart';
import 'package:otoplus_example/src/features/weather/domain/entities/weather_entity.dart';

abstract class WeatherRepository {
  Future<Either<Failure, WeatherEntity>> getWeather();
} 