// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Response _$ResponseFromJson(Map<String, dynamic> json) => Response(
      jsonrpc: json['jsonrpc'] as String,
      result: json['result'] as Map<String, dynamic>?,
      error: json['error'] == null
          ? null
          : Error.fromJson(json['error'] as Map<String, dynamic>),
      id: json['id'] as int,
    );

Map<String, dynamic> _$ResponseToJson(Response instance) => <String, dynamic>{
      'jsonrpc': instance.jsonrpc,
      'result': instance.result,
      'error': instance.error?.toJson(),
      'id': instance.id,
    };
