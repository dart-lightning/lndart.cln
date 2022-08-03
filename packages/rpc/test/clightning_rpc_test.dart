import 'dart:io';
import 'package:test/test.dart';
import 'package:clightning_rpc/clightning_rpc.dart';
import 'package:clightning_rpc/src/utils/exception/ln_client_error.dart';

void main() {
  var env = Platform.environment;
  var rpcPath = env['RPC_PATH']!;

  group('A group of test to connect the unix socket', () {
    var client = RPCClient();
    client.connect(rpcPath);

    setUp(() {});

    test('Call getinfo method test', () async {
      expect(client, isNotNull);
      var response = await client.simpleCall('getinfo');
      expect(response['network'], 'regtest');
      client.close();
    });

    test('Make a loop payment and looking for exception', () async {
      expect(client, isNotNull);
      // Docs of the parameters
      // https://lightning.readthedocs.io/lightning-invoice.7.html
      var params = <String, dynamic>{};
      params['msatoshi'] = '100000msat';
      params['label'] = 'from-dart';
      params['description'] = 'This is a unit test';

      await client.simpleCall('invoice', params: params);

      params = <String, dynamic>{};
      params['label'] = 'from-dart';
      params['status'] = 'unpaid';
      await client.simpleCall('delinvoice', params: params);
      client.close();
    });

    test('Pay invoice method test', () async {
      expect(client, isNotNull);

      var params = <String, dynamic>{};
      params['msatoshi'] = '100000msat';
      params['label'] = 'from-dart-v2';
      params['description'] = 'This is a unit test';

      var response = await client.simpleCall('invoice', params: params);
      params = <String, dynamic>{};
      params['bolt11'] = response["bolt11"];

      expect(() async => await client.simpleCall('pay', params: params),
          throwsA(isA<LNClientException>()));

      params = <String, dynamic>{};
      params['label'] = 'from-dart-v2';
      params['status'] = 'unpaid';
      await client.simpleCall('delinvoice', params: params);
      client.close();
    });
  });
}
