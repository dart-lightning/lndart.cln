import 'utils/logger_manager.dart';
import 'utils/unix_rpc_client.dart';

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

class RPCClient implements LightningClient {
  late UnixRPCClient _client;

  @override
  LightningClient connect(String path) {
    LogManager.getInstance
        .info('Connection to JSON RPC 2.0 at the following path $path');
    _client = UnixRPCClient(path);
    return this;
  }

  @override
  Future<Map<String, dynamic>> call(String method,
      {Map<String, dynamic> params = const {}}) async {
    var response = await _client.call(method, params);
    LogManager.getInstance
        .debug('Response from RPC is : ${response.toString()}');
    return response;
  }

  @override
  void close() async {}
}
