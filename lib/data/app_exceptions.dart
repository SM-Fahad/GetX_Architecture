
class AppExceptions implements Exception {
  final _message;
  final _prefix;


  AppExceptions([this._message, this._prefix]);

  @override
  String toString() {
    // if (_prefix != null) {
    //   return "AppException (prefix: $_prefix): $_message";
    // }
    return "$_message $_prefix";
  }
}

class InternetException extends AppExceptions {
  InternetException([String? message])
      : super(message, "No Internet Connection");
}

class RequestTimeOut extends AppExceptions {
  RequestTimeOut([String? message])
      : super(message, "Request Timed Out");
}

class ServerException extends AppExceptions {
  ServerException([String? message])
      : super(message, "Internal Server Error");
}

class UnauthorizeException extends AppExceptions {
  UnauthorizeException([String? message])
      : super(message, "Unauthorised Credentials");
}