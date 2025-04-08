import 'package:flutter/cupertino.dart';
import 'package:otoplus_example/src/features/posts/presentation/screens/home_screen.dart';
import 'package:otoplus_example/src/features/posts/presentation/screens/post_list_screen.dart';

class AppRouter {
  static const String home = '/';
  static const String posts = '/posts';

  final String initialRoute;
  final Map<String, Widget Function(BuildContext)> routes;

  AppRouter({
    this.initialRoute = home,
    Map<String, Widget Function(BuildContext)>? routes,
  }) : routes =
           routes ??
           {
             home: (_) => const HomeScreen(),
             posts: (_) => const PostListScreen(),
           };

  Route<dynamic> generateRoute(RouteSettings settings) {
    final routeBuilder = routes[settings.name];

    if (routeBuilder != null) {
      return CupertinoPageRoute(builder: routeBuilder);
    }

    return CupertinoPageRoute(
      builder:
          (_) => CupertinoPageScaffold(
            child: Center(
              child: Text('Hata: ${settings.name} rotası bulunamadı!'),
            ),
          ),
    );
  }
}
