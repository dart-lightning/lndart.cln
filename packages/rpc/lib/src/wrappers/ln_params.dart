// Wrapper to make the code more readable, into add params to the request.
class LNParams {
  final Map<String, dynamic> _params = const {};

  const LNParams();

  void add(String key, dynamic value) {
    _params[key] = value;
  }

  Map<String, dynamic> toJSON() => _params;
}
