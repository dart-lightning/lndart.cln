import 'package:cln_plugin_api/cln_plugin.dart';

/// N.B. This style of developing a plugin is the suggested one
/// for middle and big plugin.
///
/// This involve the possibility to develop in a more OOP style the
/// code, but also to keep the code clean a simple to read.
class MyPlugin extends Plugin {
  /// This is a method that is registered to be called by the plugin
  /// where core lightning will require it.
  Future<Map<String, Object>> firstMethod(
      Plugin plugin, Map<String, Object> request) {
    log(level: "info", message: "Calling rpc");
    return Future.value({
      "foo_opt": getOpt(key: "foo_opt") ?? "not found",
    });
  }

  Future<Map<String, Object>> onRpcCommand(
      Plugin plugin, Map<String, Object> request) {
    log(level: "info", message: "hook info");
    return Future(() => {"result": "continue"});
  }

  /// This is a method that is subscribed to be called in response to
  /// a notification emitted by core lightning.
  Future<Map<String, Object>> notifyMethod(
      Plugin plugin, Map<String, Object> request) {
    plugin.log(level: 'debug', message: 'Notification received!');
    return Future.value({});
  }

  @override
  void configurePlugin() {
    /// This is the standard way to configure a plugin in dart
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

    /// This is the standard way to subscribe to a core lightning
    /// notification.
    registerSubscriptions(event: 'connect', callback: notifyMethod);

    /// Register an hook that it is triggered by core lightning when
    /// any rpc command is executed.
    registerHook(name: "rpc_command", callback: onRpcCommand);
  }
}

void main() {
  /// Plugin initialization.
  var plugin = MyPlugin();
  plugin.start();
}
