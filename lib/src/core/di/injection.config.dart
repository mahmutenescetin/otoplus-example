// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/posts/data/datasources/remote/post_remote_data_source.dart'
    as _i493;
import '../../features/posts/data/repositories/post_repository_impl.dart'
    as _i125;
import '../../features/posts/domain/repositories/post_repository.dart' as _i450;
import '../../features/posts/domain/usecases/get_posts.dart' as _i1032;
import '../../features/posts/presentation/provider/posts_notifer.dart' as _i437;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt $initGetIt(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(getIt, environment, environmentFilter);
  gh.lazySingleton<_i493.PostRemoteDataSource>(
    () => _i493.PostRemoteDataSourceImpl(),
  );
  gh.lazySingleton<_i450.PostRepository>(
    () => _i125.PostRepositoryImpl(
      remoteDataSource: gh<_i493.PostRemoteDataSource>(),
    ),
  );
  gh.lazySingleton<_i1032.GetPosts>(
    () => _i1032.GetPosts(gh<_i450.PostRepository>()),
  );
  gh.factory<_i437.PostsNotifier>(
    () => _i437.PostsNotifier(getPostsUseCase: gh<_i1032.GetPosts>()),
  );
  return getIt;
}
