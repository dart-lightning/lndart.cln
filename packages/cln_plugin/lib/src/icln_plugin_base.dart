import 'package:cln_plugin/cln_plugin.dart';

abstract class CLNPlugin {
  void start();

  void registerFeature(
      {required String node,
      required String channel,
      required String init,
      required String invoice});

  void registerOption(
      {required String name,
      required String type,
      required String def,
      required String description,
      required bool deprecated});

  void registerSubscriptions({required String event});

  void registerHook({required String name});

  void registerNotification(
      {required String event,
      required Future<Map<String, Object>> Function(Plugin, Map<String, Object>)
          onEvent});

  void registerRPCMethod(
      {required String name,
      required String usage,
      required String description,
      required Future<Map<String, Object>> Function(Plugin, Map<String, Object>)
          callback});
}
