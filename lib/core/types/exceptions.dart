class CacheException implements Exception{
  final String message;

  CacheException({required this.message});

  @override
  String toString() {
    return "CacheException : $message";
  }
}

class NetworkException implements Exception{
  final String message;

  NetworkException({required this.message});

  @override
  String toString() {
    return "NetworkException : $message";
  }
}


class BusinessException implements Exception{
  final String message;

  BusinessException({required this.message});

  @override
  String toString() {
    return "BusinessException : $message";
  }
}

class InputValidationException implements Exception{
  final String message;

  InputValidationException({required this.message});

  @override
  String toString() {
    return "InputValidationException : $message";
  }
}