import 'package:cln_plugin_api/src/cln_plugin_base.dart';
import 'package:cln_plugin_api/src/rpc_method/types/rpc_type.dart';

class InitMethod extends RPCMethod {
  // FIXME: Unsure of what the callback should look like.
  InitMethod(
      {required Future<Map<String, Object>> Function(
              Plugin, Map<String, Object>)
          callback})
      : super(name: 'init', usage: '', description: '', callback: callback);
}
