import 'dart:convert';
import 'dart:io';

import 'package:cln_plugin/cln_plugin.dart';
import 'package:cln_plugin/src/json_rpc/request.dart';

void main() {
  // String messageSocket = stdin.readLineSync()!;
  // if (messageSocket.trim().isEmpty) {
  //   File('/home/swapnil/clightning4j/p_log.txt')
  //       .writeAsString("Empty");
  // }
  // var jsonRequest = Request.fromJson(jsonDecode(messageSocket));
  // File('/home/swapnil/clightning4j/p_log.txt')
  //     .writeAsString(jsonRequest.method.toString());
  var plugin = Plugin();
  plugin.start();
}
