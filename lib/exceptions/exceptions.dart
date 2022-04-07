class BusinessException implements Exception {
  BusinessException({required this.cause}) : super();
  String cause;
}
