# Hava Durumu Uygulaması

Bu Flutter uygulaması, kullanıcılara güncel hava durumu bilgilerini gösteren modern ve kullanıcı dostu bir arayüz sunar.

## Özellikler

- 🌍 Gerçek zamanlı hava durumu bilgileri
- 🌡️ Sıcaklık gösterimi
- ☁️ Hava durumu ikonları
- 🔄 Yenileme özelliği
- 🎨 Modern ve şık arayüz
- 📱 Responsive tasarım

## Teknolojiler

- Flutter
- Provider (State Management)
- GetIt (Dependency Injection)
- HTTP (API İstekleri)
- Material Design

## Kurulum

1. Flutter'ı yükleyin:
```bash
flutter pub get
```

2. Bağımlılıkları yükleyin:
```bash
flutter pub get
```

3. Uygulamayı çalıştırın:
```bash
flutter run
```

## Proje Yapısı

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

## Mimari

Bu proje Clean Architecture prensiplerine uygun olarak geliştirilmiştir:

- **Presentation Layer**: UI bileşenleri ve state management
- **Domain Layer**: İş mantığı ve entity'ler
- **Data Layer**: Veri kaynakları ve repository implementasyonları

## Katkıda Bulunma

1. Bu repository'yi fork edin
2. Feature branch'i oluşturun (`git checkout -b feature/amazing-feature`)
3. Değişikliklerinizi commit edin (`git commit -m 'feat: Add some amazing feature'`)
4. Branch'inizi push edin (`git push origin feature/amazing-feature`)
5. Pull Request oluşturun

