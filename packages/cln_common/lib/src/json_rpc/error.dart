import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'error.g.dart';

@JsonSerializable(includeIfNull: false)
class Error {
  /// A Number that indicates the error type that occurred.
  int code;

  /// A String providing a short description of the error.
  String message;

  /// Value that contains additional information about the error.
  Map<String, dynamic>? data;

  /// A constructor for creating a new class instance.
  Error({required this.code, required this.message, this.data});

  /// This factory function connects to the generator function
  /// to create the class.
  factory Error.fromJson(Map<String, dynamic> json) => _$ErrorFromJson(json);

  /// This function converts a generated class object back to
  /// a JSON HashMap.
  String toJson() => jsonEncode(_$ErrorToJson(this));
}
