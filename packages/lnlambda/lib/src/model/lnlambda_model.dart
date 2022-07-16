import 'package:cln_common/cln_common.dart';
import 'package:json_annotation/json_annotation.dart';

part 'lnlambda_model.g.dart';

@JsonSerializable()
class LNLambdaRequest extends Serializable {
  @JsonKey(name: "node_id")
  final String nodeID;
  final String host;
  final String rune;
  final String method;
  final Map<String, dynamic> params;

  LNLambdaRequest(
      {required this.nodeID,
      required this.host,
      required this.rune,
      required this.method,
      this.params = const {}});

  @override
  Map<String, dynamic> toJSON() => _$LNLambdaRequestToJson(this);
}
