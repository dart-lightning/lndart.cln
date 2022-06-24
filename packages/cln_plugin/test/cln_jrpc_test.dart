import 'dart:convert';

import 'package:cln_plugin/src/json_rpc/request.dart';
import 'package:test/test.dart';

void main() {
  group('JSON RPC 2.0 tests', () {
    test("Ensure that the request without id was encoding in the correct way",
        () {
      var request = Request(method: "foo", params: {}).toJson();
      expect(request.containsKey("jsonrpc"), isTrue);
      expect(request.containsKey("id"), isFalse);
    });

    test("Ensure that the request with id was encoding in the correct way", () {
      var request = Request(id: 1, method: "foo", params: {}).toJson();
      expect(request.containsKey("jsonrpc"), isTrue);
      expect(request.containsKey("id"), isTrue);
    });

    test(
        "Ensure that the request without id was encoding in the correct way in string",
        () {
      var request = jsonEncode(Request(method: "foo", params: {}).toJson());
      expect(request.contains("jsonrpc"), isTrue);
      expect(request.contains("id"), isFalse);
    });

    test(
        "Ensure that the request with id was encoding in the correct way in string",
        () {
      var request =
          jsonEncode(Request(id: 1, method: "foo", params: {}).toJson());
      expect(request.contains("jsonrpc"), isTrue);
      expect(request.contains("id"), isTrue);
    });
  });
}
