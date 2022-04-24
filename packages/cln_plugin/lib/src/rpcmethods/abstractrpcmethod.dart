class RPCMethod {
  /// Method name
  String name;

  /// Usage of this method
  String usage;

  /// Description of this method
  String description;

  /// The long description of this method
  late String longDescription;

  /// The callback function
  Function callback;

  RPCMethod(
      {required this.name,
      required this.usage,
      required this.description,
      required this.callback,
      String? longDescription}) {
    // means if is null set the longDescription = description
    this.longDescription = longDescription ?? description;
  }
}
