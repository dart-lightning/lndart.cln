class LNClientException implements Exception {
  String message;
  int code;
  String? data;

  LNClientException(this.code, this.message, this.data);
}
