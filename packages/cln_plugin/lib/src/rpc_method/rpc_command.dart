import 'package:cln_plugin/cln_plugin.dart';

class RPCCommand {
  /// Method name
  String name;

  /// Usage of this method
  String usage;

  /// Description of this method
  String description;

  /// The long description of this method
  late String longDescription;

  /// The callback function
  Future<Map<String, Object>> Function(Plugin, Map<String, Object>) callback;

  RPCCommand(
      {required this.name,
      required this.usage,
      required this.description,
      required this.callback,
      String? longDescription}) {
    // means if is null set the longDescription = description
    this.longDescription = longDescription ?? description;
  }

  Future<Map<String, Object>> call(
      Plugin plugin, Map<String, Object> request) async {
    return await callback(plugin, request);
  }
}
