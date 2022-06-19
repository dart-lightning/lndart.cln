/// Client interface to implement a custom client for core lightning
/// Implementing this class give a easy access to all the application that
/// support dart with this interface.
///
/// author: https://github.com/vincenzopalazzo

/// Client interface to create a (c-)lightning client
/// That can support different protocols.
abstract class LightningClient {
  // Connect interface to initialize the client
  // with the correct protocol.
  LightningClient connect(String url);

  // Generic method to call a method in (c-)lightning
  Future<Map<String, dynamic>> call(String method,
      {Map<String, dynamic> params = const {}});

  void close();
}
