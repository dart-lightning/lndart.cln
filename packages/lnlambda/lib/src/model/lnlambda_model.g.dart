// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lnlambda_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LNLambdaRequest _$LNLambdaRequestFromJson(Map<String, dynamic> json) =>
    LNLambdaRequest(
      nodeID: json['node_id'] as String,
      host: json['host'] as String,
      rune: json['rune'] as String,
      method: json['method'] as String,
      params: json['params'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$LNLambdaRequestToJson(LNLambdaRequest instance) =>
    <String, dynamic>{
      'node_id': instance.nodeID,
      'host': instance.host,
      'rune': instance.rune,
      'method': instance.method,
      'params': instance.params,
    };
