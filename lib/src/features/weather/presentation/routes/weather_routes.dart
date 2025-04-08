import 'package:flutter/material.dart';
import 'package:otoplus_example/src/features/weather/presentation/screens/weather_view.dart';

enum WeatherRoutes {
  weather('/weather');

  final String path;
  const WeatherRoutes(this.path);
}

extension WeatherRoutesExtension on WeatherRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/weather':
        return MaterialPageRoute(builder: (_) => const WeatherView());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('Weather route bulunamadı: ${settings.name}'),
            ),
          ),
        );
    }
  }
} 