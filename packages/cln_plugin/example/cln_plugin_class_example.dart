import 'package:cln_plugin/cln_plugin.dart';

/// N.B. This style of developing a plugin is the suggested one
/// for middle and big plugin.
///
/// This involve the possibility to develop in a more OOP style the
/// code, but also to keep the code clean a simple to read.

class MyPlugin extends Plugin {
  Future<Map<String, Object>> firstMethod(
      Plugin plugin, Map<String, Object> request) {
    log(level: "info", message: "Calling rpc");
    return Future.value({
      "foo_opt": getOpt(key: "foo_opt") ?? "not found",
    });
  }

  @override
  void configurePlugin() {
    // This is the standard way to register a plugin
    registerOption(
        name: "foo_opt",
        type: "string",
        def: "hello",
        description: "This is an example of how the option looks like");

    /// This is the standard way to register a custom rpc method
    registerRPCMethod(
        name: "first_method",
        usage: "",
        description: "This is an example of custom rpc method",
        callback: (plugin, request) => firstMethod(plugin, request));
  }
}

void main() {
  var plugin = MyPlugin();
  plugin.start();
}
