import 'package:cln_plugin_api/src/cln_plugin_base.dart';
import 'package:cln_plugin_api/src/rpc_method/rpc_command.dart';

class RPCMethod extends RPCCommand {
  /// Method name
  String name;

  /// Usage of this method
  String usage;

  /// Description of this method
  String description;

  /// The long description of this method
  late String longDescription;

  /// Mark if the method is deprecated or not
  bool deprecated;

  RPCMethod(
      {required this.name,
      required this.usage,
      required this.description,
      required Future<Map<String, Object>> Function(Plugin, Map<String, Object>)
          callback,
      this.deprecated = false,
      String? longDescription})
      : super(callback: callback) {
    // means if is null set the longDescription = description
    this.longDescription = longDescription ?? description;
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "usage": usage,
      "description": description,
      "long_description": longDescription,
      "deprecated": deprecated,
    };
  }
}

class RPCNotification extends RPCCommand {
  /// Notification method name
  String method;

  RPCNotification(
      {required this.method,
      required Future<Map<String, Object>> Function(Plugin, Map<String, Object>)
          callback})
      : super(callback: callback);

  @override
  Map<String, dynamic> toMap() {
    return {"method": method};
  }
}

class RPCHook extends RPCCommand {
  /// Hook name
  String name;

  /// Hook called before this list of plugins
  List<String>? before;

  /// Hook called after this list of plugins
  List<String>? after;

  RPCHook(
      {required this.name,
      this.before,
      this.after,
      required Future<Map<String, Object>> Function(Plugin, Map<String, Object>)
          callback})
      : super(callback: callback);

  @override
  Map<String, dynamic> toMap() {
    Map<String, dynamic> payload = {};
    payload["name"] = name;
    if (before != null) {
      payload['before'] = before;
    }
    if (after != null) {
      payload['after'] = after;
    }
    return payload;
  }
}
