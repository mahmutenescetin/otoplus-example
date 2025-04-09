import 'package:flutter/material.dart';
import 'package:otoplus_example/src/core/di/injection.dart';
import 'package:otoplus_example/src/core/localization/presentation/extensions/context_extension.dart';
import 'package:otoplus_example/src/features/weather/presentation/provider/weather_notifier.dart';
import 'package:provider/provider.dart';

class WeatherView extends StatelessWidget {
  const WeatherView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => getIt<WeatherNotifier>()..fetchWeather(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(context.l10n.appTitle),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        body: Consumer<WeatherNotifier>(
          builder: (context, notifier, child) {
            Widget content;

            if (notifier.error != null) {
              content = Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.error_outline,
                      color: Colors.red,
                      size: 50,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      '${context.l10n.errorUnknown}: ${notifier.error}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.red, fontSize: 16),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () => notifier.fetchWeather(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                      ),
                      child: Text(context.l10n.startButton),
                    ),
                  ],
                ),
              );
            } else if (notifier.weather == null) {
              content = const SizedBox.shrink();
            } else {
              final weather = notifier.weather!;
              content = Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromRGBO(33, 150, 243, 0.8),
                      Color.fromRGBO(0, 150, 136, 0.6),
                    ],
                  ),
                ),
                child: RefreshIndicator(
                  onRefresh: () => notifier.fetchWeather(),
                  displacement: 20,
                  strokeWidth: 2,
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    children: [
                      const SizedBox(height: 30),
                      Text(
                        weather.location,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 30),
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(255, 255, 255, 0.2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            Image.network(
                              'https:${weather.icon}',
                              width: 120,
                              height: 120,
                            ),
                            const SizedBox(height: 20),
                            Text(
                              '${weather.temperature.round()}°C',
                              style: const TextStyle(
                                fontSize: 64,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(255, 255, 255, 0.3),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                weather.condition,
                                style: const TextStyle(
                                  fontSize: 22,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                      Text(
                        '${context.l10n.humidity}: ${weather.humidity}%',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '${context.l10n.windSpeed}: ${weather.windSpeed} km/h',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 30),
                      Text(
                        context.l10n.lastUpdate(
                          '${DateTime.now().hour}:${DateTime.now().minute.toString().padLeft(2, '0')}'
                        ),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color.fromRGBO(255, 255, 255, 0.8),
                        ),
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              );
            }

            return Stack(
              children: [
                content,
                if (notifier.isLoading)
                  const Center(child: CircularProgressIndicator()),
              ],
            );
          },
        ),
      ),
    );
  }
}
