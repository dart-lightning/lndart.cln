import 'package:clightning_rpc/clightning_rpc.dart';
import 'package:cln_common/cln_common.dart';

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

Future<void> main() async {
  var client = RPCClient();
  client
      .connect('/media/vincent/Maxtor/C-lightning/node/bitcoin/lightning-rpc');
  var response = await client.simpleCall('getinfo');
  print(response);

  var params = <String, dynamic>{
    'msatoshi': '100000msat',
    'label': 'from-dart-1',
    'description': 'This is a unit test'
  };
  response = await client.call(
      method: 'invoice',
      params: GetInvoiceRequest(
          '100000msat', 'from-dart-1', 'This is a unit test'));
  print(response);

  params = <String, dynamic>{
    'label': params['label'],
    'status': 'unpaid',
  };
  response = await client.simpleCall('delinvoice', params: params);
  print(response);
}
