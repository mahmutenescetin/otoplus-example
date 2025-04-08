# Weather Application

This Flutter application provides users with a modern and user-friendly interface to display current weather information.

## Features

- 🌍 Real-time weather information
- 🌡️ Temperature display
- ☁️ Weather icons
- 🔄 Refresh functionality
- 🎨 Modern and elegant interface
- 📱 Responsive design

## Technologies

- Flutter
- Provider (State Management)
- GetIt (Dependency Injection)
- HTTP (API Requests)
- Material Design

## Installation

1. Install Flutter:
```bash
flutter pub get
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the application:
```bash
flutter run
```

## Project Structure

```
lib/
├── src/
│   ├── core/
│   │   ├── di/
│   │   │   └── injection.dart
│   │   └── network/
│   │       └── api_client.dart
│   └── features/
│       └── weather/
│           ├── data/
│           │   ├── datasources/
│           │   │   └── weather_remote_data_source.dart
│           │   ├── models/
│           │   │   └── weather_model.dart
│           │   └── repositories/
│           │       └── weather_repository_impl.dart
│           ├── domain/
│           │   ├── entities/
│           │   │   └── weather.dart
│           │   ├── repositories/
│           │   │   └── weather_repository.dart
│           │   └── usecases/
│           │       └── get_weather.dart
│           └── presentation/
│               ├── provider/
│               │   └── weather_notifier.dart
│               ├── routes/
│               │   └── app_router.dart
│               └── screens/
│                   ├── welcome_screen.dart
│                   └── weather_view.dart
└── main.dart
```

## Architecture

This project is developed following Clean Architecture principles:

- **Presentation Layer**: UI components and state management
- **Domain Layer**: Business logic and entities
- **Data Layer**: Data sources and repository implementations

## Contributing

1. Fork this repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'feat: Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

