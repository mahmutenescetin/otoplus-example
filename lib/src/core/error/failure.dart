import 'package:equatable/equatable.dart';

abstract class Failure {
  final String? message;
  const Failure({this.message});
}

class ServerFailure extends Failure {
  const ServerFailure({String? message}) : super(message: message);
}

class NetworkFailure extends Failure {
  const NetworkFailure({String? message}) : super(message: message);
}

class DataParsingFailure extends Failure {
  const DataParsingFailure({String? message}) : super(message: message);
}

class UnknownFailure extends Failure {
  const UnknownFailure({String? message}) : super(message: message);
}

class CacheFailure extends Failure {}
