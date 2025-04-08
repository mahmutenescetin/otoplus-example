import 'package:injectable/injectable.dart';
import 'package:otoplus_example/src/core/error/exceptions.dart';
import 'package:otoplus_example/src/core/network/api_client.dart';
import 'package:otoplus_example/src/features/weather/data/models/weather_model.dart';

abstract class WeatherRemoteDataSource {
  Future<WeatherModel> getWeather();
}

@LazySingleton(as: WeatherRemoteDataSource)
class WeatherRemoteDataSourceImpl implements WeatherRemoteDataSource {
  final ApiClient _apiClient;
  final String _apiKey = '92ee789d91c54ddabc705231250804';
  final String _baseUrl = 'https://api.weatherapi.com/v1';

  WeatherRemoteDataSourceImpl(this._apiClient);

  @override
  Future<WeatherModel> getWeather() async {
    try {
      final response = await _apiClient.get(
        '$_baseUrl/forecast.json?key=$_apiKey&q=Istanbul&days=3&aqi=no&alerts=no&lang=tr'
      );
      return WeatherModel.fromJson(response);
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
} 