/// Dart Wrapper to make the code more readable
class LNResponse {
  final Map<String, dynamic> _params = const {};

  const LNResponse();

  // Get the value of the response
  dynamic get(String key) {
    return _params[key];
  }

  dynamic operator [](other) {
    return get(other);
  }

  LNResponse.fromJson(Map<String, dynamic> json) {
    _params.clear(); //TO be sure.
    json.forEach((key, value) { _params[key] = value; });
  }

  Map<String, dynamic> toJSON() => _params;
}