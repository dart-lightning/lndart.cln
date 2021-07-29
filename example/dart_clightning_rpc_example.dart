import 'package:dart_clightning_rpc/dart_clightning_rpc.dart';

void main() {
  var client = WebSocketClient();
  client.connect('127.0.0.1:9735');
}
