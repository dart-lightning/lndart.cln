/// This file contains some integration test to be able to the plugin implemented
/// from core lightning in dart inside the example directory.
///
/// In this way we can be sure that the plugin ran as expected, and there is no
/// regression introduced with some PRs.

import 'dart:io';
import 'package:test/test.dart';
import 'package:clightning_rpc/clightning_rpc.dart';

void main() {
  var env = Platform.environment;
  var rpcPath = env['RPC_PATH']!;
  group('A group of test to connect the test cln plugin', () {
    setUp(() {});

    test('Call foo method inside of the plugin example', () async {
      var client = RPCClient();
      client.connect(rpcPath);
      var response = await client.call('foo');
      expect(response['language'].toString().toLowerCase(), 'dart');
    });

    test('Call fist_method inside the plugin', () async {
      var client = RPCClient();
      client.connect(rpcPath);
      var response = await client.call('first_method');
      expect(response['foo_opt'].toString().toLowerCase(), 'hello');
    });
  });
}
