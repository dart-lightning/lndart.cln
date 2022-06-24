import 'utils/unix_rpc_client.dart';
import 'package:cln_common/cln_common.dart';

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
  Future<Map<String, dynamic>> simpleCall(String method,
      {Map<String, dynamic> params = const {}}) async {
    var response = await _client.call(method, params);
    LogManager.getInstance
        .debug('Response from RPC is : ${response.toString()}');
    return response;
  }

  @override
  void close() async {}

  @override
  Future<T> call<R extends Serializable, T>(
      {required String method,
      required R params,
      T Function(Map)? onDecode}) async {
    var response = await _client.call(method, params);
    LogManager.getInstance
        .debug('Response from RPC is : ${response.toString()}');
    if (onDecode != null) {
      return onDecode(response);
    }
    return response;
  }
}
