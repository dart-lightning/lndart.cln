<div align="center">
  <h1>lndart.cln_common</h1>

  <img src="https://github.com/dart-lightning/icons/raw/main/main/res/mipmap-xxxhdpi/ic_launcher.png" />

  <p>
    <strong> :dart: cln_common provides all the utils and the interface used in the lndart.cln package and also the derivation of this package like plugins. :dart: </strong>
  </p>
 <h4>
    <a href="https://github.com/dart-lightning">Project Homepage</a>
  </h4>

  <a>
   <img alt="GitHub Workflow Status" src="https://img.shields.io/github/workflow/status/dart-lightning/clightning.dart/Sanity%20Check?style=flat-square">
  </a>
    
  <a>
    <img alt="Pub Popularity" src="https://img.shields.io/pub/popularity/cln_common?style=flat-square">
  </a>

  <a> 
     <img alt="Pub Points" src="https://img.shields.io/pub/points/cln_common?style=flat-square">
  </a>

</div>

## Table of Content

- Introduction
- How to use
- How to contribute
- License

## Introduction

Proposed solution for the package fragmentation across different package and application that used a basic package like building blocks.

## How to use

### How to use LogManager

We provide a logging manager that you can use in the following way

```dart
import "package:cln_common/cln_common.dart";

void main() {
  LogManager.getInstance.debug("This is an awesome debug print");
}
```

### How to implement your own LightningClient

You can implement your own client that follow the rules of the cln.dart package with the following basic class

```dart
/// Client interface to create a core lightning client
/// That can support different protocols.
abstract class LightningClient {
  // Connect interface to initialize the client
  // with the correct protocol.
  LightningClient connect(String url);

  Future<T> call<R extends Serializable, T>(
      {required String method, required R params, T Function(Map)? onDecode});

  // Generic method to call a method in core lightning
  Future<Map<String, dynamic>> simpleCall(String method,
      {Map<String, dynamic> params = const {}});

  void close();
}
```

In order to use our powerful client method `call` we input request need to follow the class rules

```dart
abstract class Serializable {
  Map<String, dynamic> toJSON();

  T as<T>() => this as T;
}
```

### How to create a valid JSON RPC 2.0

If you need to send you a JSON RPC 2.0 PRC 2.0 request or response you can use the following class

```dart
import "package:cln_common/cln_common.dart";

void main() {
  var request = Request(id: 12, method: "method_name", params: {});
  LogManager.getInstance.info("JSON 2.0 request ${request.toJson()}");
  // you can build this map from a JSON string with dart built in tools
  var responseStr = { 
    "id": 12,
    "jsonrpc": "22",
    "result": {}
  };
  var response = Response.fromJson(responseStr);
  LogManager.getInstance.info("JSON 2.0 response ${response.toJson()}");
}
```

## How to contribute

Read our [Hacking guide](https://docs.page/dart-lightning/lndart.cln/dev/MAINTAINERS)

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