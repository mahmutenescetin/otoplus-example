

abstract class Failure {
  final String? message;
  const Failure({this.message});
}

class ServerFailure extends Failure {
  const ServerFailure({super.message});
}

class NetworkFailure extends Failure {
  const NetworkFailure({super.message});
}

class DataParsingFailure extends Failure {
  const DataParsingFailure({super.message});
}

class UnknownFailure extends Failure {
  const UnknownFailure({super.message});
}

class CacheFailure extends Failure {}
