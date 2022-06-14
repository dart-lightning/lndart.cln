import 'package:cln_plugin/src/cln_plugin_base.dart';
import 'package:cln_plugin/src/rpc_method/rpc_command.dart';

class InitMethod extends RPCCommand {
  // FIXME: Unsure of what the callback should look like.
  InitMethod(
      {required Future<Map<String, Object>> Function(
              Plugin, Map<String, Object>)
          callback})
      : super(name: 'init', usage: '', description: '', callback: callback);
}
