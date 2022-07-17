import 'package:cln_plugin_api/cln_plugin.dart';

/// N.B. This style of developing a plugin is the suggested one
/// for small plugins.
///
/// This involve the possibility to develop in a more OOP style the
/// code, but also to keep the code clean a simple to read.

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
      description: "an example of how register a ",
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
