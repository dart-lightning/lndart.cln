<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->
<div align="center">
  <h1>lndart.clightning</h1>

  <img src="https://github.com/dart-lightning/icons/raw/main/main/res/mipmap-xxxhdpi/ic_launcher.png" />

  <p>
    <strong> :dart: dart library to develop custom plugins in dart for core lightning  :dart: </strong>
  </p>

  <p>
   <img alt="GitHub Workflow Status" src="https://img.shields.io/github/workflow/status/dart-lightning/clightning.dart/Sanity%20Check?style=flat-square">
  </p>

  <h4>
    <a href="https://github.com/dart-lightning">Project Homepage</a>
  </h4>
</div>

This package provides an easy and comprehensive interface to develop custom plugins for core lightning in the Dart programming environment. Plugins developed using this library conform to the JSON-RPCv2 specifications.

## Table of Content

- Features
- Getting Started
- How to contribute
- License

## Features

TODO: List what your package can do. Maybe include images, gifs, or videos.

## Getting started

The simplest way to get started is to instantiate an object of the `Plugin` class.
```dart
var plugin = Plugin();
plugin.start();
```
This object can then be used to expose the different methods that allow the plugin to register the following with the core lightning daemon:
- Option using the`registerOption()`.
- RPC Command using the `registerRPCMethod()`.
- Notification using the `registerNotification()`.
- Hook using the `registerHook()`.
- Feature using the `registerFeature()`.
- Subscriptions using `registerSubscriptions()`.

Refer [here]('insert_docs_link_here') for more implementations on how to use the API.

The interface also allows extending the `Plugin` class.

```dart
class MyPlugin extends Plugin {}

void main() {
  var plugin = MyPlugin();
  plugin.start();
}
```
We can define a custom callback function to return a JSON object that would serve as the response to the method request.

```dart
Future<Map<String, Object>> sayHello(Plugin plugin, Map<String, Object> request) {
    return Future.value({
      "msg": "hello world",
    });
  }
```

We can then override the `configurePlugin()` method with custom implementation to implement behavior by executing the callback function defined earlier.
```dart
@override
void configurePlugin() {
  // This is an easy implementation of the plugin
  registerRPCMethod(
      name: "hello",
      usage: "[name]",
      description: "Returns a greeting.",
      callback: (plugin, request) => sayHello(plugin, request));
  }
```

Refer to the `/example` for more complete examples on how to use the library.

[This](https://github.com/dart-lightning/dart_plugin) is a template to easily create plugins for core lightning.
## How to contribute

Read our [Hacking Guide]().

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