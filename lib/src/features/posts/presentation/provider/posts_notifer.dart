import 'package:flutter/foundation.dart'; // ChangeNotifier için
import 'package:injectable/injectable.dart';
import 'package:otoplus_example/src/core/error/failure.dart';
import 'package:otoplus_example/src/core/usecase/usecase.dart';
import 'package:otoplus_example/src/features/posts/domain/entities/post_entity.dart';
import 'package:otoplus_example/src/features/posts/domain/usecases/get_posts.dart'; // DI

@injectable // Bu sınıfın da GetIt tarafından yönetilmesini sağlıyoruz
class PostsNotifier extends ChangeNotifier {
  final GetPosts getPostsUseCase; // Post'ları almak için UseCase

  // Constructor Injection ile UseCase'i alıyoruz
  PostsNotifier({required this.getPostsUseCase});

  // --- State Değişkenleri ---
  // Değişkenleri private (_) yapıp getter ile dışarı açmak iyi bir pratiktir.
  bool _isLoading = false; // Yüklenme durumu
  List<PostEntity> _posts = []; // Post listesi
  String? _errorMessage; // Hata mesajı (varsa)

  // --- State Getter'ları (UI bu getter'ları kullanacak) ---
  bool get isLoading => _isLoading;

  List<PostEntity> get posts => _posts;

  String? get errorMessage => _errorMessage;

  // --- State'i Güncelleyen Fonksiyon (UI tarafından tetiklenecek) ---
  Future<void> fetchPosts() async {
    // 1. Yüklenme durumunu başlat
    _isLoading = true;
    _errorMessage = null; // Önceki hatayı temizle
    notifyListeners(); // UI'a yüklenmenin başladığını bildir

    // 2. UseCase'i çağır
    final failureOrPosts = await getPostsUseCase(NoParams());

    // 3. Sonucu işle (fold ile)
    failureOrPosts.fold(
      (failure) {
        // Hata durumu: Hata mesajını ayarla
        _errorMessage = _mapFailureToMessage(failure);
      },
      (postsData) {
        // Başarı durumu: Post listesini ayarla
        _posts = postsData;
      },
    );

    // 4. Yüklenme durumunu bitir
    _isLoading = false;
    notifyListeners(); // UI'a işlemin bittiğini ve yeni durumu bildir
  }

  // --- Yardımcı Fonksiyon (Failure'ı okunabilir mesaja çevirir) ---
  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure _:
        final serverFailure = failure as ServerFailure;
        return serverFailure.message ?? 'Sunucu Hatası';
      case CacheFailure _:
        return 'Önbellek Hatası';
      default:
        return 'Bilinmeyen bir hata oluştu.';
    }
  }
}
