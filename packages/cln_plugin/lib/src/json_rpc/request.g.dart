// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Request _$RequestFromJson(Map<String, dynamic> json) => Request(
      jsonrpc: json['jsonrpc'] as String,
      method: json['method'] as String,
      id: json['id'] as int,
      params: json['params'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$RequestToJson(Request instance) => <String, dynamic>{
      'jsonrpc': instance.jsonrpc,
      'id': instance.id,
      'method': instance.method,
      'params': instance.params,
    };
