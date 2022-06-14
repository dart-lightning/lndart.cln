import 'package:cln_plugin/cln_plugin.dart';
import 'package:cln_plugin/src/rpc_method/rpc_command.dart';

/// GetManifest is a command implementation of the get manifest method
/// that takes in input the callback to return the necessary data
/// that core lightning required.
class GetManifest extends RPCCommand {
  GetManifest(
      {required Future<Map<String, Object>> Function(
              Plugin, Map<String, Object>)
          callback})
      : super(
            name: "getmanifest",
            usage: "",
            description: "",
            callback: callback);
}
