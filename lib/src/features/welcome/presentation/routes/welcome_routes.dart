import 'package:flutter/material.dart';
import 'package:otoplus_example/src/features/welcome/presentation/screens/welcome_screen.dart';

enum WelcomeRoutes {
  welcome('/');

  final String path;
  const WelcomeRoutes(this.path);
}

extension WelcomeRoutesExtension on WelcomeRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('Welcome route bulunamadı: ${settings.name}'),
            ),
          ),
        );
    }
  }
} 