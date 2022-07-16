import 'dart:io';

import 'package:clightning_rpc/clightning_rpc.dart';
import 'package:cln_common/cln_common.dart';
import 'package:lnlambda/lnlambda.dart';
import 'package:test/test.dart';

void main() {
  RPCClient rpcClient;
  group('A group of tests', () {
    rpcClient = RPCClient();
    rpcClient.connect("");

    setUp(() {
      var env = Platform.environment;
      var rpcPath = env['RPC_PATH']!;
      rpcClient = RPCClient();
      rpcClient.connect(rpcPath);
    });

    test("testing usage lambda services", () async {
      var getInfo = await rpcClient.simpleCall("getinfo");
      var commandRune = await rpcClient.simpleCall("commando-rune", params: {
        "restrictions": "readonly",
      });
      var client = LNLambdaClient(
          nodeID: getInfo["id"]!,
          host: "52.55.124.1:19735",
          rune: commandRune["rune"],
          lambdaServer: "127.0.0.1:9002");
      var response = client.simpleCall("getinfo", params: {});
      LogManager.getInstance.debug("Response from lambda $response");
    });
  });
}
