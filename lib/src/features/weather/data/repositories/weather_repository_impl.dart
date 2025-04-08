import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:otoplus_example/src/core/error/exceptions.dart';
import 'package:otoplus_example/src/core/error/failure.dart';
import 'package:otoplus_example/src/features/weather/data/datasources/remote/weather_remote_data_source.dart';
import 'package:otoplus_example/src/features/weather/domain/entities/weather_entity.dart';
import 'package:otoplus_example/src/features/weather/domain/repositories/weather_repository.dart';

@LazySingleton(as: WeatherRepository)
class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherRemoteDataSource remoteDataSource;

  WeatherRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, WeatherEntity>> getWeather() async {
    try {
      final weatherModel = await remoteDataSource.getWeather();
      
      final weatherEntity = WeatherEntity(
        location: weatherModel.location.name,
        temperature: weatherModel.current.tempC,
        condition: weatherModel.current.condition.text,
        icon: weatherModel.current.condition.icon,
        windSpeed: weatherModel.current.windKph,
        humidity: weatherModel.current.humidity,
      );

      return Right(weatherEntity);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } on FormatException catch (e) {
      return Left(DataParsingFailure(message: 'Veri dönüşüm hatası: ${e.message}'));
    } catch (e) {
      if (e.toString().contains('SocketException') || 
          e.toString().contains('NetworkException')) {
        return Left(NetworkFailure(message: 'İnternet bağlantısı hatası'));
      }
      return Left(UnknownFailure(message: 'Bilinmeyen bir hata oluştu: ${e.toString()}'));
    }
  }
}
