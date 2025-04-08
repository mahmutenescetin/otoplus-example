import 'package:flutter/material.dart';
import 'package:otoplus_example/src/features/weather/presentation/screens/welcome_screen.dart';
import 'package:otoplus_example/src/features/weather/presentation/screens/weather_view.dart';

class AppRouter {
  static const String welcome = '/';
  static const String weather = '/weather';

  String get initialRoute => welcome;

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case welcome:
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());
      case weather:
        return MaterialPageRoute(builder: (_) => const WeatherView());
      default:
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());
    }
  }
}
