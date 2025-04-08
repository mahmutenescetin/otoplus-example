class WeatherEntity {
  final String location;
  final double temperature;
  final String condition;
  final String icon;
  final double windSpeed;
  final int humidity;

  WeatherEntity({
    required this.location,
    required this.temperature,
    required this.condition,
    required this.icon,
    required this.windSpeed,
    required this.humidity,
  });
}
