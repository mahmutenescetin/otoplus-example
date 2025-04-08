import 'package:injectable/injectable.dart';
import 'package:otoplus_example/src/core/network/api_client.dart';
import 'package:otoplus_example/src/core/network/api_endpoints.dart';
import 'package:otoplus_example/src/features/weather/data/models/weather_model.dart';

abstract class WeatherRemoteDataSource {
  Future<WeatherModel> getWeather();
}

@Injectable(as: WeatherRemoteDataSource)
class WeatherRemoteDataSourceImpl implements WeatherRemoteDataSource {
  final ApiClient apiClient;

  WeatherRemoteDataSourceImpl(this.apiClient);

  @override
  Future<WeatherModel> getWeather() async {
    final response = await apiClient.get(ApiEndpoints.comments);
    return WeatherModel.fromJson(response);
  }
}
