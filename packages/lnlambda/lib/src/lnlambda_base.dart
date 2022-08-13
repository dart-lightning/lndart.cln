import 'dart:convert';

import 'package:cln_common/cln_common.dart';
import 'package:http/http.dart' as http;
import 'package:lnlambda/src/model/lnlambda_model.dart';

class LNLambdaClient implements LightningClient {
  final String nodeID;
  final String host;
  final String lambdaServer;
  final String? rune;

  LNLambdaClient(
      {required this.nodeID,
      required this.host,
      required this.lambdaServer,
      this.rune});

  @override
  Future<T> call<R extends Serializable, T>(
      {required String method,
      required R params,
      T Function(Map p1)? onDecode}) async {
    var response = await simpleCall(method, params: params.toJSON());
    if (onDecode != null) {
      return onDecode(response);
    }
    return Future(() => response as T);
  }

  @override
  void close() {}

  @override
  LightningClient connect(String url) => this;

  @override
  Future<Map<String, dynamic>> simpleCall(String method,
      {Map<String, dynamic> params = const {}}) async {
    var callRune = rune;
    if (params.containsKey("steal_rune")) {
      callRune = params["steal_rune"]!;
      params.remove("steal_rune");
    }
    if (callRune == null) {
      throw Exception(
          "A rune for the call need to be specified or in the params as `steal_rune` or in the client constructor as default rune");
    }
    var request = LNLambdaRequest(
        nodeID: nodeID,
        host: host,
        rune: callRune,
        method: method,
        params: params);
    var response = await http.post(Uri.parse("$lambdaServer/lnsocket"),
        headers: {
          "Accept": "application/json",
          "Access-Control_Allow_Origin": "*",
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: json.encode(request.toJSON()));
    Map<String, dynamic> result = json.decode(response.body);
    if (result.containsKey("errors")) {
      throw Exception(response.body);
    }
    return result["result"];
  }
}
