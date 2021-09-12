import 'dart:io';
import 'package:test/test.dart';
import 'package:clightning.dart/clightning_rpc_base.dart';

void main() {
  var env = Platform.environment;
  var rpcPath = env["RPC_PATH"]!;
  group('A group of test to connect the unix socket', () {
    setUp(() {});

    test('Connection test', () {
      var client = RPCClient();
      client.connect(rpcPath);
      expect(client, isNotNull);
      client.close();
    });

    test('Call getinfo method test', () async {
      var client = RPCClient();
      client.connect(rpcPath);
      expect(client, isNotNull);
      var response = await client.call('getinfo');
      expect(response['network'], 'testnet');
      client.close();
    });

    test('Call invoice method test', () async {
      var client = RPCClient();
      client.connect(rpcPath);
      expect(client, isNotNull);
      // Docs of the parametes
      // https://lightning.readthedocs.io/lightning-invoice.7.html
      var params = <String, dynamic>{};
      params['msatoshi'] = '100000msat';
      params['label'] = 'from-dart';
      params['description'] = 'This is a unit test';

      await client.call('invoice', params: params);

      params = <String, dynamic>{};
      params['label'] = 'from-dart';
      params['status'] = 'unpaid';
      await client.call('delinvoice', params: params);
      client.close();
    });
  });
}
