// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Response _$ResponseFromJson(Map<String, dynamic> json) => Response(
      id: json['id'] as int,
      result: json['result'] as Map<String, dynamic>?,
      error: json['error'] == null
          ? null
          : Error.fromJson(json['error'] as Map<String, dynamic>),
    )..jsonrpc = json['jsonrpc'] as String;

Map<String, dynamic> _$ResponseToJson(Response instance) => <String, dynamic>{
      'jsonrpc': instance.jsonrpc,
      'result': instance.result,
      'error': instance.error?.toJson(),
      'id': instance.id,
    };
