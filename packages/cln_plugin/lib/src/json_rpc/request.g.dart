// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Request _$RequestFromJson(Map<String, dynamic> json) => Request(
      id: json['id'] as int?,
      method: json['method'] as String,
      params: json['params'],
      jsonrpc: json['jsonrpc'] as String? ?? "2.0",
    );

Map<String, dynamic> _$RequestToJson(Request instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('jsonrpc', instance.jsonrpc);
  writeNotNull('id', instance.id);
  val['method'] = instance.method;
  writeNotNull('params', instance.params);
  return val;
}
