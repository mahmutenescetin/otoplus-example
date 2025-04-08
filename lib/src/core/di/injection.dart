import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as i1;
import 'package:injectable/injectable.dart';
import 'injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: true,
  asExtension: false,
)
Future<void> configureDependencies() async {
  getIt.registerLazySingleton<i1.Client>(() => i1.Client());
  $initGetIt(getIt);
}
