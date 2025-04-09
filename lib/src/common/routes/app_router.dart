import 'package:flutter/material.dart';
import 'package:otoplus_example/src/features/welcome/presentation/routes/welcome_routes.dart';
import 'package:otoplus_example/src/features/weather/presentation/routes/weather_routes.dart';

class AppRouter {
  String get initialRoute => WelcomeRoutes.welcome.path;

  static Route<dynamic> generateRoute(RouteSettings settings) {
    if (settings.name?.startsWith(WeatherRoutes.weather.path) ?? false) {
      return WeatherRoutesExtension.generateRoute(settings);
    }

    return WelcomeRoutesExtension.generateRoute(settings);
  }
}
