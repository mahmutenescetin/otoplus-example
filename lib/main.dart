import 'package:flutter/material.dart';
import 'package:otoplus_example/src/common/routes/app_router.dart';
import 'package:otoplus_example/src/core/di/injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hava Durumu',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
      ),
      initialRoute: AppRouter().initialRoute,
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
