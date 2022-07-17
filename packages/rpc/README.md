<div align="center">
  <h1>lndart.cln</h1>

  <img src="https://github.com/dart-lightning/icons/raw/main/main/res/mipmap-xxxhdpi/ic_launcher.png" />

  <p>
    <strong> :dart: Dart framework for Core Lightning to work with the RPC interface :dart: </strong>
  </p>

  <h4>
    <a href="https://github.com/dart-lightning">Project Homepage</a>
  </h4>

  <a>
   <img alt="GitHub Workflow Status" src="https://img.shields.io/github/workflow/status/dart-lightning/clightning.dart/Sanity%20Check?style=flat-square">
  </a>

  <a>
    <img alt="Pub Popularity" src="https://img.shields.io/pub/popularity/clightning_rpc?style=flat-square">
  </a>

  <a> 
     <img alt="Pub Points" src="https://img.shields.io/pub/points/clightning_rpc?style=flat-square">
  </a>
</div>

## Table of Content

- Introduction
- How to Use
- How Contribute
- License

## Introduction

Generic and Fast way to have your app connected with core lightning with dart and Unix sockets.

## How to Use
```dart
import 'package:clightning.dart/clightning_rpc.dart';

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

## How to contribute

Read our [Hacking guide](https://docs.page/dart-lightning/lndart.clightning/dev/MAINTAINERS)

## License

<div align="center">
  <img src="https://opensource.org/files/osi_keyhole_300X300_90ppi_0.png" width="150" height="150"/>
</div>

```
Copyright 2022 Vincenzo Palazzo <vincenzopalazzodev@gmail.com>. All rights reserved.

Redistribution and use in source and binary forms, with or without modification,
are permitted provided that the following conditions are met:

    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above
      copyright notice, this list of conditions and the following
      disclaimer in the documentation and/or other materials provided
      with the distribution.
    * Neither the name of Google Inc. nor the names of its
      contributors may be used to endorse or promote products derived
      from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
