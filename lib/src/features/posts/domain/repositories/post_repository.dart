import 'package:dartz/dartz.dart';
import 'package:otoplus_example/src/core/error/failure.dart';
import 'package:otoplus_example/src/features/posts/domain/entities/post_entity.dart';

abstract class PostRepository {
  Future<Either<Failure, List<PostEntity>>> getPosts();
}
