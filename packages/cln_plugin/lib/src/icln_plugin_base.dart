abstract class CLNPlugin {
  void start();

  void registerFeature(
      {required String node,
      required String channel,
      required String init,
      required String invoice});

  void registerRPCMethod(
      {required String name,
      required String usage,
      required String description,
      required Function callback});

  void registerOption(
      {required String name,
      required String type,
      required String def,
      required String description,
      required bool deprecated});

  void registerSubscriptions({required String event});

  void registerHook({required String name});

  void registerNotification({required String event, required Function onEvent});
}
