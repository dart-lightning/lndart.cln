import 'package:cln_plugin/src/rpcmethods/abstractrpcmethod.dart';

class InitMethod extends RPCMethod {
  // FIXME: Unsure of what the callback should look like.
  InitMethod()
      : super(name: 'init', usage: '', description: '', callback: () => {});
}
