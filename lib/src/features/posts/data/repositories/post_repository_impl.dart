import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:otoplus_example/src/core/error/exceptions.dart';
import 'package:otoplus_example/src/core/error/failure.dart';
import 'package:otoplus_example/src/features/posts/data/datasources/remote/post_remote_data_source.dart';
import 'package:otoplus_example/src/features/posts/domain/entities/post_entity.dart';
import 'package:otoplus_example/src/features/posts/domain/repositories/post_repository.dart';

@LazySingleton(as: PostRepository)
class PostRepositoryImpl implements PostRepository {
  final PostRemoteDataSource remoteDataSource;

  PostRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<PostEntity>>> getPosts() async {
    try {
      final remotePosts = await remoteDataSource.getPosts();
      return Right(remotePosts);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message ?? 'Sunucu hatası oluştu.'));
    } catch (e) {
      if (kDebugMode) {
        print('PostRepositoryImpl Error: $e');
      }
      return Left(
        ServerFailure(message: 'Bilinmeyen bir hata oluştu: ${e.toString()}'),
      );
    }
  }
}
