import 'package:flutter/cupertino.dart';
import 'package:otoplus_example/src/core/di/injection.dart';
import 'package:otoplus_example/src/features/weather/presentation/routes/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = AppRouter();
    
    return CupertinoApp(
      title: 'Hava Durumu',
      debugShowCheckedModeBanner: false,
      theme: const CupertinoThemeData(
        brightness: Brightness.light,
        primaryColor: CupertinoColors.systemBlue,
      ),
      initialRoute: router.initialRoute,
      onGenerateRoute: router.generateRoute,
    );
  }
}
