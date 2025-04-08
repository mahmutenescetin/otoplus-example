import 'package:otoplus_example/src/features/weather/domain/entities/weather_entity.dart';

class WeatherModel extends WeatherEntity {
  const WeatherModel({
    required super.condition,
    required super.temperature,
    required super.city,
    required super.icon,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    final current = json['current'] as Map<String, dynamic>;
    final location = json['location'] as Map<String, dynamic>;
    
    return WeatherModel(
      condition: current['condition']['text'] as String,
      temperature: (current['temp_c'] as num).toDouble(),
      city: location['name'] as String,
      icon: current['condition']['icon'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'condition': condition,
      'temperature': temperature,
      'city': city,
      'icon': icon,
    };
  }
} 