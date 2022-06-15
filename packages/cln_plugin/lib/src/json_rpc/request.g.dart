// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Request _$RequestFromJson(Map<String, dynamic> json) => Request(
      id: json['id'] as int,
      method: json['method'] as String,
      params: json['params'] as Map<String, dynamic>,
    )..jsonrpc = json['jsonrpc'] as String;

Map<String, dynamic> _$RequestToJson(Request instance) => <String, dynamic>{
      'jsonrpc': instance.jsonrpc,
      'id': instance.id,
      'method': instance.method,
      'params': instance.params,
    };
