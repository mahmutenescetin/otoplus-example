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

  WeatherRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, WeatherEntity>> getWeather() async {
    try {
      final remoteWeather = await remoteDataSource.getWeather();
      return Right(remoteWeather);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message ?? 'Sunucu hatası oluştu.'));
    } catch (e) {
      if (kDebugMode) {
        print('WeatherRepositoryImpl Error: $e');
      }
      return Left(
        ServerFailure(message: 'Bilinmeyen bir hata oluştu: ${e.toString()}'),
      );
    }
  }
} 