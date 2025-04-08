import 'package:dartz/dartz.dart'; // Either
import 'package:injectable/injectable.dart';
import 'package:otoplus_example/src/core/error/failure.dart';
import 'package:otoplus_example/src/core/usecase/usecase.dart';
import 'package:otoplus_example/src/features/posts/domain/entities/post_entity.dart';
import 'package:otoplus_example/src/features/posts/domain/repositories/post_repository.dart'; // DI

// Bu UseCase'i de DI ile yönetilebilir hale getiriyoruz
@lazySingleton
class GetPosts implements UseCase<List<PostEntity>, NoParams> {
  final PostRepository repository; // İşlemi yapmak için Repository'ye ihtiyaç duyar

  // Constructor Injection ile Repository'yi al
  GetPosts(this.repository);

  // UseCase'in çağrıldığı yer. Parametre almıyor (NoParams).
  // Repository'nin getPosts metodunu çağırıp sonucunu direkt döndürüyor.
  @override
  Future<Either<Failure, List<PostEntity>>> call(NoParams params) async {
    return await repository.getPosts();
  }
}
