abstract class Failure {
  final String message;
  const Failure(this.message);

}

class ServerFailure extends Failure {
  const ServerFailure(String message) : super(message);
}

class RequestFailure extends Failure {
  const RequestFailure(String message) : super(message);
}

class AuthorityFailure extends Failure {
  const AuthorityFailure(String message) : super(message);
}

class InputFailure extends Failure {
  const InputFailure(String message) : super(message);
}

class ConnectionFailure extends Failure {
  const ConnectionFailure(String message) : super(message);
}
