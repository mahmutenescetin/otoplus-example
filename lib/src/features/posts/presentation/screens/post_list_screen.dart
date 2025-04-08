import 'package:flutter/cupertino.dart'; // Cupertino widget'ları
import 'package:flutter/material.dart';

import 'package:otoplus_example/src/core/di/injection.dart';
import 'package:otoplus_example/src/features/posts/presentation/provider/posts_notifer.dart';
import 'package:provider/provider.dart'; // Provider

class PostListScreen extends StatelessWidget {
  const PostListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => getIt<PostsNotifier>()..fetchPosts(),
      child: CupertinoPageScaffold(
        // iOS tarzı temel sayfa yapısı
        navigationBar: const CupertinoNavigationBar(
          // iOS tarzı App Bar
          middle: Text('Gönderiler (Provider)'), // Ekran başlığı
        ),
        child: SafeArea(
          // Ekran kenarlarındaki çentik vb. alanlardan korur
          // Consumer: PostsNotifier'daki değişiklikleri dinler ve UI'ı yeniden çizer.
          child: Consumer<PostsNotifier>(
            builder: (context, notifier, child) {
              // 1. Yüklenme durumu kontrolü
              if (notifier.isLoading) {
                // Ortada dönen bir yüklenme göstergesi göster
                return const Center(child: CupertinoActivityIndicator());
              }
              // 2. Hata durumu kontrolü
              if (notifier.errorMessage != null) {
                // Ortada hata mesajını göster
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Hata: ${notifier.errorMessage}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: CupertinoColors.systemRed,
                        fontSize: 16,
                      ),
                    ),
                  ),
                );
              }
              // 3. Başarılı veri durumu (ve veri varsa)
              if (notifier.posts.isNotEmpty) {
                // Kaydırılabilir liste oluştur
                return ListView.builder(
                  itemCount: notifier.posts.length, // Listenin eleman sayısı
                  itemBuilder: (context, index) {
                    final post = notifier.posts[index]; // O anki post verisi
                    // iOS tarzı liste elemanı için ListTile'ı Card içinde kullanabiliriz
                    return Card(
                      elevation: 2, // Hafif gölge
                      margin: const EdgeInsets.symmetric(
                        horizontal: 12.0,
                        vertical: 6.0,
                      ),
                      child: ListTile(
                        leading: CircleAvatar(
                          // Başında ID'nin yazdığı daire
                          backgroundColor: CupertinoColors.systemGrey4,
                          child: Text(
                            post.id.toString(),
                            style: const TextStyle(
                              color: CupertinoColors.black,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        title: Text(
                          // Post başlığı
                          post.title,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          // Post içeriği (kısaltılmış)
                          post.body,
                          maxLines: 2, // En fazla 2 satır göster
                          overflow: TextOverflow.ellipsis, // Sığmazsa ... koy
                        ),
                      ),
                    );
                  },
                );
              }
              // 4. Veri yok durumu (başlangıçta veya API boş dönerse)
              return const Center(
                child: Text('Gösterilecek gönderi bulunamadı.'),
              );
            },
          ),
        ),
      ),
    );
  }
}
