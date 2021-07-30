import 'dart:convert';

import 'package:dart_clightning_rpc/src/wrappers/ln_params.dart';
import 'package:dart_clightning_rpc/src/utils/logger_manager.dart';
import 'package:dart_clightning_rpc/src/utils/unix_rpc_client.dart';
import 'package:dart_clightning_rpc/src/wrappers/ln_response.dart';
import 'package:json_rpc_2/json_rpc_2.dart';
import 'package:pedantic/pedantic.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

/// Client interface to create a (c-)lightning client
/// That can support different protocols.
abstract class LightningClient {
  // Connect interface to initialize the client
  // with the correct protocol.
  LightningClient connect(String url);

  // Generic method to call a method in (c-)lightning
  Future<Map<String, dynamic>> call(String method,
      {Map<String, dynamic> payload = const {}});

  void close();
}

class RPCClient implements LightningClient {
  late UnixRPCClient _client;

  @override
  LightningClient connect(String path) {
    LogManager.getInstance.info(
        'Connection to JSON RPC 2.0 at the following path $path');
    _client = UnixRPCClient(path);
    return this;
  }

  @override
  Future<Map<String, dynamic>> call(String method,
      {Map<String, dynamic> payload = const {}}) async {
    var response = await _client.call(method, payload);
    LogManager.getInstance.debug('Response from RPC is : ${response.toString()}');
    return response;
  }

  @override
  void close() async {
    //TODO implement this stuff
  }
}

class WebSocketClient implements LightningClient {
  late Client _client;

  @override
  LightningClient connect(String url) {
    var wsUrl = 'wss://$url';
    LogManager.getInstance.info(
        'Connection to websocket at the following link $wsUrl');
    var socket = WebSocketChannel.connect(Uri.parse(wsUrl));
    _client = Client(socket.cast<String>()); //TODO: Check this initialization method.
    unawaited(_client.listen());
    return this;
  }

  @override
  Future<Map<String, dynamic>> call(String method,
      {Map<String, dynamic> payload = const {}}) async {
    var response = await _client.sendRequest(method, payload);
    LogManager.getInstance.debug(response);
    return jsonDecode(response);
  }

  @override
  void close() {
    _client.close();
  }
}