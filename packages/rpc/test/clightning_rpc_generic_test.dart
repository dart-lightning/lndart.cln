import 'dart:io';
import 'package:cln_common/cln_common.dart';
import 'package:test/test.dart';
import 'package:clightning_rpc/clightning_rpc.dart';

class GetInfoRequest extends Serializable {
  @override
  Map<String, dynamic> toJSON() => {};
}

// Docs of the parametes
// https://lightning.readthedocs.io/lightning-invoice.7.html
class GetInvoiceRequest extends Serializable {
  String msatoshi;
  String label;
  String description;
  GetInvoiceRequest(this.msatoshi, this.label, this.description);

  @override
  Map<String, dynamic> toJSON() =>
      {"msatoshi": msatoshi, "label": label, "description": description};
}

void main() {
  var env = Platform.environment;
  var rpcPath = env['RPC_PATH']!;

  group('A group of test to connect the unix socket', () {
    setUp(() {});

    test('Call getinfo method test to serialize', () async {
      var client = RPCClient();
      client.connect(rpcPath);
      expect(client, isNotNull);
      var response =
          await client.call(method: 'getinfo', params: GetInfoRequest());
      expect(response['network'], 'regtest');
      client.close();
    });

    test('Call invoice method test', () async {
      var client = RPCClient();
      client.connect(rpcPath);
      expect(client, isNotNull);

      await client.call(
          method: 'invoice',
          params: GetInvoiceRequest(
              '100000msat', 'from-dart', 'This is a unit test'));

      var params = <String, dynamic>{};
      params['label'] = 'from-dart';
      params['status'] = 'unpaid';
      await client.simpleCall('delinvoice', params: params);
      client.close();
    });
  });
}
