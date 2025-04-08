import 'package:flutter/cupertino.dart';
import 'package:otoplus_example/src/features/posts/presentation/routes/app_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(middle: Text('Ana Sayfa')),
      child: Center(
        child: CupertinoButton.filled(
          child: const Text('Gönderileri Gör'),
          onPressed: () {
            Navigator.pushNamed(context, AppRouter.posts);
          },
        ),
      ),
    );
  }
}
