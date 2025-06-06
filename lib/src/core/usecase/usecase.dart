import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:otoplus_example/src/core/error/failure.dart';

abstract class UseCase<Type, NoParams> {
  Future<Either<Failure, Type>> call(NoParams params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
