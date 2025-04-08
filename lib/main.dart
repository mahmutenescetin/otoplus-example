import 'package:flutter/material.dart';
import 'package:otoplus_example/src/common/routes/app_router.dart';
import 'package:otoplus_example/src/core/di/injection.dart';
import 'package:otoplus_example/src/core/localization/data/models/app_localizations_model.dart';
import 'package:otoplus_example/src/core/localization/presentation/provider/locale_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final localeProvider = getIt<LocaleProvider>();

    return ChangeNotifierProvider.value(
      value: localeProvider,
      child: Consumer<LocaleProvider>(
        builder: (context, localeProvider, _) {
          return MaterialApp(
            title: 'Hava Durumu',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              appBarTheme: const AppBarTheme(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
            ),
            locale: localeProvider.locale,
            localizationsDelegates:
                AppLocalizationsModel.localizationsDelegates,
            supportedLocales: AppLocalizationsModel.supportedLocales,
            initialRoute: AppRouter().initialRoute,
            onGenerateRoute: AppRouter.generateRoute,
          );
        },
      ),
    );
  }
}
