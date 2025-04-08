import 'package:injectable/injectable.dart';
import 'package:otoplus_example/src/core/error/exceptions.dart';
import 'package:otoplus_example/src/core/network/api_client.dart';
import 'package:otoplus_example/src/core/network/api_endpoints.dart';
import 'package:otoplus_example/src/features/posts/data/models/post_model.dart';

abstract class PostRemoteDataSource {
  Future<List<PostModel>> getPosts();
}

@LazySingleton(as: PostRemoteDataSource)
class PostRemoteDataSourceImpl implements PostRemoteDataSource {
  final ApiClient _apiClient;

  PostRemoteDataSourceImpl(this._apiClient);

  @override
  Future<List<PostModel>> getPosts() async {
    try {
      final response = await _apiClient.get(ApiEndpoints.posts);
      final List<dynamic> jsonList = response as List<dynamic>;
      return jsonList.map((json) => PostModel.fromJson(json)).toList();
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
