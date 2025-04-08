import 'package:equatable/equatable.dart';

class WeatherEntity extends Equatable {
  final String condition;
  final double temperature;
  final String city;
  final String icon;

  const WeatherEntity({
    required this.condition,
    required this.temperature,
    required this.city,
    required this.icon,
  });

  @override
  List<Object?> get props => [condition, temperature, city, icon];
} 