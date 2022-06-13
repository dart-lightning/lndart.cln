import 'package:json_annotation/json_annotation.dart';
import 'error.dart';

part 'response.g.dart';

@JsonSerializable(explicitToJson: true)
class Response {
  /// A String specifying the version of the JSON-RPC protocol.
  /// MUST be exactly "2.0".
  String jsonrpc;

  /// This structure contains additional information about the
  /// result returned from the function.
  Map<String, dynamic>? result;

  /// This field contains information about an unsuccessful call
  /// and stores information about it.
  Error? error;

  /// An identifier established by the Server.
  int id;

  /// A constructor for creating a new class instance.
  Response(
      {required this.jsonrpc,
      required this.result,
      required this.error,
      required this.id});

  /// This factory function connects to the generator function
  /// to create the class.
  factory Response.fromJson(Map<String, dynamic> json) =>
      _$ResponseFromJson(json);

  /// This function converts a generated class object back to
  /// a JSON HashMap.
  Map<String, dynamic> toJson() => _$ResponseToJson(this);
}
