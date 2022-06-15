import 'package:json_annotation/json_annotation.dart';

part 'request.g.dart';

@JsonSerializable(includeIfNull: false)
class Request {
  /// A String specifying the version of the JSON-RPC protocol.
  /// MUST be exactly "2.0".
  String? jsonrpc;

  /// An identifier established by the Client.
  /// Since core lightning uses int, we will enforce this type omitting
  /// the JSON-RPC 2.0 spec.
  int? id;

  /// A String containing the name of the method to be invoked.
  String method;

  /// A map that holds the parameter values to be used during
  /// the invocation of the method.
  dynamic params;

  /// A constructor for creating a new class instance.
  Request(
      {this.id,
      required this.method,
      required this.params,
      this.jsonrpc = "2.0"});

  /// This factory function connects to the generator function
  /// to create the class.
  factory Request.fromJson(Map<String, dynamic> json) =>
      _$RequestFromJson(json);

  /// This function converts a generated class object back to
  /// a JSON HashMap.
  Map<String, dynamic> toJson() => _$RequestToJson(this);
}
