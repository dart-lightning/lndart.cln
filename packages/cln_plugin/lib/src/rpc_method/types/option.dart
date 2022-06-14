class Option {
  /// name of the option
  String name;

  /// type of the option
  String type;

  /// default value of the option
  String def;

  /// description of the option
  String description;

  /// mark deprecated or not
  bool deprecated;

  Option(
      {required this.name,
      required this.type,
      required this.def,
      required this.description,
      required this.deprecated});
}
