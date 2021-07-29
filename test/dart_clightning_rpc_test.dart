import 'package:dart_clightning_rpc/dart_clightning_rpc.dart';
import 'package:test/test.dart';

void main() {
  group('A group of test to connect the WS connections', () {

    setUp(() { });

    test('Connection test', () {
      var client = WebSocketClient();
      client.connect('127.0.0.1:9735');
      expect(client, isNotNull);
    });
  });
}
