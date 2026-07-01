class AppException implements Exception {
  final String message;
  final String? code;

  AppException({required this.message, this.code});

  @override
  String toString() => message;
}

class AuthException extends AppException {
  AuthException({required super.message, super.code});
}

class FirestoreException extends AppException {
  FirestoreException({required super.message, super.code});
}

class StorageException extends AppException {
  StorageException({required super.message, super.code});
}
