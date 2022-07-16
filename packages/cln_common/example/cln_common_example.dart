import "package:cln_common/cln_common.dart";

void main() {
  var request = Request(id: 12, method: "method_name", params: {});
  LogManager.getInstance.info("JSON 2.0 request ${request.toJson()}");
  // you can build this map from a JSON string with dart built in tools
  var responseStr = {"id": 12, "jsonrpc": "22", "result": {}};
  var response = Response.fromJson(responseStr);
  LogManager.getInstance.info("JSON 2.0 response ${response.toJson()}");
}
