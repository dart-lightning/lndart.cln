import 'package:cln_plugin_api/cln_plugin.dart';

/// N.B. This style of developing a plugin is the suggested one
/// for small plugins.
///
/// This involves the possibility to develop in a more object oriented style which
/// also to keeps the code clean and simple to read.

void main() {
  var plugin = Plugin(
      dynamic: true,
      onInit: (plugin) {
        plugin.log(
            level: "info",
            message:
                "RPC path file is ${plugin.configuration['lightning-rpc']}");
        return Future.value({});
      });
  plugin.registerRPCMethod(
      name: "foo",
      usage: "",
      description:
          "an example of how to register a RPC method with the plugin.",
      callback: (plugin, request) => Future.value(<String, Object>{
            "msg": "Hello",
            "language": "dart",
          }));
  plugin.registerOption(
      name: 'greeting',
      type: 'string',
      def: "World",
      description: "What name should I call you?",
      deprecated: false);
  plugin.registerHook(
      name: "rpc_command",
      callback: (plugin, request) {
        plugin.log(level: "info", message: "hook info");
        return Future(() => {"result": "continue"});
      });
  plugin.start();
}
