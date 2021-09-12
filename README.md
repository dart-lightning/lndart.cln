<div align="center">
  <h1>clightning.dart</h1>

  <img src="https://github.com/dart-lightning/icons/raw/main/main/res/mipmap-xxxhdpi/ic_launcher.png" />


  <p>
    <strong>Dart framework for C-Lightning to work with the RPC interface.</strong>
  </p>

  <p>
   <img alt="GitHub Workflow Status" src="https://img.shields.io/github/workflow/status/dart-lightning/clightning.dart/Sanity%20Check?style=flat-square">
  </p>

  <h4>
    <a href="https://github.com/dart-lightning">Project Homepage</a>
  </h4>
</div>

## Table of Content

- Introduction
- How to Use
- How Contribute
- License

## Introduction
TODO

## How to Use
```dart
import 'package:clightning.dart/clightning_rpc_base.dart';

Future<void> main() async {
  var client = RPCClient();
  client.connect('/media/vincent/Maxtor/C-lightning/node/bitcoin/lightning-rpc');
  var response = await client.call('getinfo');
  print(response);

  var params = <String, dynamic>{
    'msatoshi': '100000msat',
    'label': 'from-dart-1',
    'description': 'This is a unit test'
  };
  response = await client.call('invoice', params: params);
  print(response);

  params = <String, dynamic>{
    'label': params['label'],
    'status': 'unpaid',
  };
  response = await client.call('delinvoice', params: params);
  print(response);
}
    
```
## How Contribute
TODO
## License