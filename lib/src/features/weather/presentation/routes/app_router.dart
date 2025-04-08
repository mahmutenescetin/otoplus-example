import 'package:flutter/cupertino.dart';
import 'package:otoplus_example/src/features/weather/presentation/screens/welcome_screen.dart';

class AppRouter {
  static const String welcome = '/';

  String get initialRoute => welcome;

  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case welcome:
        return CupertinoPageRoute(
          builder: (_) => const WelcomeScreen(),
        );
      default:
        return CupertinoPageRoute(
          builder: (_) => const WelcomeScreen(),
        );
    }
  }
} 