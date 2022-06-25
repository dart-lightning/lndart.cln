import 'package:cln_plugin/cln_plugin.dart';

abstract class RPCCommand {
  /// The callback function
  Future<Map<String, Object>> Function(Plugin, Map<String, Object>) callback;

  RPCCommand({required this.callback});

  Future<Map<String, Object>> call(
      Plugin plugin, Map<String, Object> request) async {
    return await callback(plugin, request);
  }

  Map<String, dynamic> toMap();
}
