class LNClientException implements Exception {
  String message;
  int code;
  String? data;

  LNClientException({required this.code, required this.message, this.data});
}
