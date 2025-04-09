# Weather Application

This Flutter application provides users with a modern and user-friendly interface to display current weather information.

## Features

- 🌍 Real-time weather information
- 🌡️ Temperature display
- ☁️ Weather icons
- 🔄 Refresh functionality
- 🎨 Modern and elegant interface
- 📱 Responsive design
- 🌐 Multi-language support (TR/EN)

## Technologies

- Flutter
- Provider (State Management)
- GetIt (Dependency Injection)
- HTTP (API Requests)
- Material Design
- Flutter Localizations

## Installation

1. Install Flutter:
```bash
flutter pub get
```

2. Install dependencies:
```bash
flutter pub get
```

3. Generate files:
```bash
# Generate localization files
flutter gen-l10n

# Generate dependency injection files
flutter pub run build_runner build --delete-conflicting-outputs
```

4. Run the application:
```bash
flutter run
```

## Project Structure

```
lib/
├── src/
│   ├── core/
│   │   ├── di/
│   │   │   ├── injection.dart
│   │   │   └── generated/
│   │   │       └── injectable.config.dart
│   │   ├── localization/
│   │   │   └── presentation/
│   │   │       └── l10n/
│   │   │           ├── app_en.arb
│   │   │           └── app_tr.arb
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

## Generated Files

The project uses code generation for:
- **Localization**: Generated files are in `.dart_tool/flutter_gen/gen_l10n/`
- **Dependency Injection**: Generated files are in `lib/src/core/di/generated/`

These generated files should not be committed to version control. They are automatically generated when running the respective commands.

## Architecture

This project is developed following Clean Architecture principles:

- **Presentation Layer**: UI components and state management
- **Domain Layer**: Business logic and entities
- **Data Layer**: Data sources and repository implementations

## Localization

The application supports multiple languages (Turkish and English). To add new translations:

1. Add new strings to `lib/src/core/localization/presentation/l10n/app_en.arb`
2. Add corresponding translations to `lib/src/core/localization/presentation/l10n/app_tr.arb`
3. Run `flutter gen-l10n` to generate the localization files

## Contributing

1. Fork this repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'feat: Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

