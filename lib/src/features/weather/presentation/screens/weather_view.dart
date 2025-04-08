import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:otoplus_example/src/core/di/injection.dart';
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
          title: const Text('Hava Durumu'),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        body: Consumer<WeatherNotifier>(
          builder: (context, notifier, child) {
            if (notifier.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (notifier.errorMessage != null) {
              return Center(
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
                      'Hata: ${notifier.errorMessage}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 16,
                      ),
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
                      child: const Text('Tekrar Dene'),
                    ),
                  ],
                ),
              );
            }

            final weather = notifier.weather;
            if (weather != null) {
              return Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.blue.withOpacity(0.8),
                      Colors.teal.withOpacity(0.6),
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
                        weather.city,
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
                          color: Colors.white.withOpacity(0.2),
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
                                color: Colors.white.withOpacity(0.3),
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
                        'Son Güncelleme: ${DateTime.now().hour}:${DateTime.now().minute.toString().padLeft(2, '0')}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white.withOpacity(0.8),
                        ),
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              );
            }

            return const Center(
              child: Text(
                'Hava durumu bilgisi alınamadı.',
                style: TextStyle(fontSize: 16),
              ),
            );
          },
        ),
      ),
    );
  }
} 