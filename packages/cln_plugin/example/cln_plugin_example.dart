import 'dart:convert';
import 'dart:io';

import 'package:cln_plugin/cln_plugin.dart';
import 'package:cln_plugin/src/json_rpc/request.dart';

void main() {
  var plugin = Plugin(dynamic: true);
  plugin.registerRPCMethod(
      name: "foo",
      usage: "",
      description: "an example of how register a ",
      callback: (plugin, request) => Future.value(<String, Object>{
            "msg": "Hello",
            "language": "dart",
          }));
  plugin.start();
}
