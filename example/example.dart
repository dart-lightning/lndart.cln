import 'package:clightning.dart/clightning_rpc_base.dart';

Future<void> main() async {
  var client = RPCClient();
  client
      .connect('/media/vincent/Maxtor/C-lightning/node/bitcoin/lightning-rpc');
  var response = await client.call('getinfo');
  print(response);

  var params = <String, dynamic>{
    'msatoshi': '100000msat',
    'label': 'from-dart-1',
    'description': 'This is a unit test'
  };
  response = await client.call('invoice', params: params);
  print(response);

  params = <String, dynamic>{
    'label': params['label'],
    'status': 'unpaid',
  };
  response = await client.call('delinvoice', params: params);
  print(response);
}
