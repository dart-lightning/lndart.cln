import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:cln_common/cln_common.dart';
import 'package:jsonrpc2/jsonrpc2.dart';
import 'exception/ln_client_error.dart';

class UnixRPCClient extends ServerProxyBase {
  UnixRPCClient(String path) : super(path);

  @override
  Future<String> transmit(String package) async {
    var address = InternetAddress(resource, type: InternetAddressType.unix);
    // https://api.dart.dev/stable/2.13.4/dart-io/Socket/port.html
    // 0 is used to indicate that it is a unix socket.
    var completer = Completer<String>();
    var socket = await Socket.connect(address, 0);
    socket.add(utf8.encode(package));

    socket.listen(
        (event) {
          LogManager.getInstance
              .debug('Event received is ${utf8.decode(event)}');
          Map<String, dynamic> eventMap = jsonDecode(utf8.decode(event));
          if (eventMap.containsKey("error")) {
            var error = eventMap["error"];
            var exception = LNClientException(
                error["code"], error["message"], error["data"]);
            completer.completeError(exception);
          } else {
            completer.complete(utf8.decode(event));
          }
        },
        onDone: () => LogManager.getInstance.debug('End JSON RPC Stream'),
        onError: (error) {
          LogManager.getInstance.error(error);
          completer.completeError(error);
        });
    return completer.future;
  }
}
