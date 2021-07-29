import 'package:web_socket_channel/io.dart';
import 'package:json_rpc_2/json_rpc_2.dart';

/// Client interface to create a (c-)lightning client
/// That can support different protocols.
abstract class LightningClient {
  // Connect interface to initialize the client
  // with the correct protocol.
  LightningClient connect(String url);
  // Generic method to call a method in (c-)lightning
  Future<Map<String, Object>>? call(String method, {Map<String, Object> payload = const {}});
}

class RPCClient implements LightningClient {
  late Client _client;

  @override
  LightningClient connect(String url) {
    var socket = IOWebSocketChannel.connect(Uri.parse(url));
    _client = Client(socket.cast()); //TODO: Check this initialization method.
    return this;
  }

  @override
  Future<Map<String, Object>>? call(String method, {Map<String, Object> payload= const {}}) {
    return _client.sendRequest(method, payload) as Future<Map<String, Object>>; //TODO check this information
  }
}

class WebSocketClient implements LightningClient {
  late IOWebSocketChannel _client;

  @override
  LightningClient connect(String url) {
    _client = IOWebSocketChannel.connect(Uri.parse('ws://$url'));
    return this;
  }

  @override
  Future<Map<String, Object>>? call(String method, {Map<String, Object> payload = const {}}) {
    throw UnimplementedError();
  }
}