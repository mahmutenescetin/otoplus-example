import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';
import 'package:otoplus_example/src/core/error/exceptions.dart';
import 'package:otoplus_example/src/features/posts/data/models/post_model.dart';

abstract class PostRemoteDataSource {
  Future<List<PostModel>> getPosts();
}

@LazySingleton(as: PostRemoteDataSource)
class PostRemoteDataSourceImpl implements PostRemoteDataSource {
  final Client client;

  @factoryMethod
  PostRemoteDataSourceImpl() : client = Client();

  final Uri _postsUrl = Uri.parse('https://jsonplaceholder.typicode.com/posts');

  @override
  Future<List<PostModel>> getPosts() async {
    try {
      final response = await client.get(
        _postsUrl,
        headers: {'Content-Type': 'application/json'},
      );
      if (response.statusCode == 200) {
        final List<dynamic> jsonList = json.decode(response.body);
        return jsonList.map((json) => PostModel.fromJson(json)).toList();
      } else {
        throw ServerException(message: 'API Error: ${response.statusCode}');
      }
    } catch (e) {
      if (kDebugMode) {
        print('PostRemoteDataSource Error: $e');
      }
      throw ServerException(
        message: 'Veri alınırken bir sorun oluştu: ${e.toString()}',
      );
    }
  }
}
