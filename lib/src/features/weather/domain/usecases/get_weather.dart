import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:otoplus_example/src/core/error/failure.dart';
import 'package:otoplus_example/src/core/usecase/usecase.dart';
import 'package:otoplus_example/src/features/weather/domain/entities/weather_entity.dart';
import 'package:otoplus_example/src/features/weather/domain/repositories/weather_repository.dart';

@lazySingleton
class GetWeather implements UseCase<WeatherEntity, NoParams> {
  final WeatherRepository repository;

  GetWeather(this.repository);

  @override
  Future<Either<Failure, WeatherEntity>> call(NoParams params) async {
    return await repository.getWeather();
  }
}
