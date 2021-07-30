import 'package:dart_clightning_rpc/dart_clightning_rpc.dart';
import 'package:test/test.dart';

void main() {
  group('A group of test to connect the WS connections', () {

    setUp(() { });

    test('Connection test', () {
      var client = RPCClient();
      client.connect('/media/vincent/Maxtor/C-lightning/node/testnet/lightning-rpc');
      expect(client, isNotNull);
      client.close();
    });

    test('Call getinfo method test', () async {
      var client = RPCClient();
      client.connect('/media/vincent/Maxtor/C-lightning/node/testnet/lightning-rpc');
      expect(client, isNotNull);
      var response = await client.call('getinfo');
      expect(response["network"], "testnet");
      client.close();
    });

    test('Call invoice method test', () async {
      var client = RPCClient();
      client.connect('/media/vincent/Maxtor/C-lightning/node/testnet/lightning-rpc');
      expect(client, isNotNull);
      // Docs of the parametes
      // https://lightning.readthedocs.io/lightning-invoice.7.html
      var params = <String, dynamic>{};
      params['msatoshi'] = '100000msat';
      params['label'] = 'from-dart';
      params['description'] = 'This is a unit test';

      await client.call('invoice', payload: params);

      params = <String, dynamic>{};
      params['label'] = 'from-dart';
      params['status'] = 'unpaid';
      await client.call('delinvoice', payload: params);
      client.close();
    });
  });
}
