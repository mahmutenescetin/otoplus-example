import 'package:injectable/injectable.dart';
import 'package:otoplus_example/src/core/error/exceptions.dart';
import 'package:otoplus_example/src/core/network/api_client.dart';
import 'package:otoplus_example/src/features/weather/data/datasources/remote/weather_api_endpoints.dart';
import 'package:otoplus_example/src/features/weather/data/models/weather_response_model.dart';

abstract class WeatherRemoteDataSource {
  Future<WeatherResponseModel> getWeather();
}

@LazySingleton(as: WeatherRemoteDataSource)
class WeatherRemoteDataSourceImpl implements WeatherRemoteDataSource {
  final ApiClient _apiClient;
  final String _apiKey = '92ee789d91c54ddabc705231250804';
  final String _baseUrl = 'https://api.weatherapi.com/v1';

  WeatherRemoteDataSourceImpl(this._apiClient);

  @override
  Future<WeatherResponseModel> getWeather() async {
    try {
      final url = WeatherApiEndpoints.forecast.buildUrl(
        apiKey: _apiKey,
        baseUrl: _baseUrl,
      );
      
      final response = await _apiClient.get(url);
      return WeatherResponseModel.fromJson(response);
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
