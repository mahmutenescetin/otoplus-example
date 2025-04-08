import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:otoplus_example/src/core/di/injection.dart';
import 'package:otoplus_example/src/features/weather/presentation/provider/weather_notifier.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => getIt<WeatherNotifier>()..fetchWeather(),
      child: CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          middle: Text('Hava Durumu'),
        ),
        child: SafeArea(
          child: Consumer<WeatherNotifier>(
            builder: (context, notifier, child) {
              if (notifier.isLoading) {
                return const Center(child: CupertinoActivityIndicator());
              }

              if (notifier.errorMessage != null) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        CupertinoIcons.exclamationmark_circle,
                        color: CupertinoColors.systemRed,
                        size: 50,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Hata: ${notifier.errorMessage}',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: CupertinoColors.systemRed,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 20),
                      CupertinoButton(
                        onPressed: () => notifier.fetchWeather(),
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
                        CupertinoColors.systemBlue.withOpacity(0.8),
                        CupertinoColors.systemTeal.withOpacity(0.6),
                      ],
                    ),
                  ),
                  child: CustomScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    slivers: [
                      CupertinoSliverRefreshControl(
                        onRefresh: () => notifier.fetchWeather(),
                      ),
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: [
                              const SizedBox(height: 30),
                              Text(
                                weather.city,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: CupertinoColors.white,
                                ),
                              ),
                              const SizedBox(height: 30),
                              Container(
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: CupertinoColors.white,
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
                                        color: CupertinoColors.white,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 16,
                                        vertical: 8,
                                      ),
                                      decoration: BoxDecoration(
                                        color: CupertinoColors.white,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Text(
                                        weather.condition,
                                        style: const TextStyle(
                                          fontSize: 22,
                                          color: CupertinoColors.white,
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
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: CupertinoColors.white,
                                ),
                              ),
                              const SizedBox(height: 30),
                            ],
                          ),
                        ),
                      ),
                    ],
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
      ),
    );
  }
}
