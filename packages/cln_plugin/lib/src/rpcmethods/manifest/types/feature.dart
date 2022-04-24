class Feature {
  /// features announced to all nodes in the network
  String node;

  /// features announced to channel
  String channel;

  /// features announced to direct peers during setup
  String init;

  /// features announced to a potential sender in the invoice
  String invoice;

  Feature(
      {required this.node,
      required this.channel,
      required this.init,
      required this.invoice});
}
