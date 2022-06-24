import 'dart:collection';
import 'dart:math';

import 'package:cln_plugin/src/cln_plugin_base.dart';
import 'package:cln_plugin/src/rpc_method/rpc_command.dart';
import 'package:test/test.dart';

void main() {
  group('Manifest test: ', () {
    var plugin = Plugin(
        dynamic: true,
        onInit: (plugin) {
          return Future.value({});
        });
    test('Property test - dynamic', () {
      // We set dynamic as true in the plugin initialization, let's test the property.
      expect(plugin.dynamic.runtimeType, bool);
      expect(plugin.dynamic, true);
    });
    plugin.registerRPCMethod(
        name: "foo",
        usage: "this specifies the usage",
        description: "an example of how register a RPC Method",
        callback: (plugin, request) => Future.value(<String, Object>{
              "msg": "Hello",
              "language": "dart",
            }));
    test('Property test - rpcMethods', () async {
      // We added a RPC Method, we expect the class property rpcMethods to be non empty.
      expect(plugin.rpcMethods.isNotEmpty, true);

      // We expect the name of the plugin to be set as foo, as in the registerRPCMethod()
      expect(plugin.rpcMethods["foo"]!.name.toLowerCase(), "foo");

      // We expect the description of the plugin to be set as the string in the registerRPCMethod()
      expect(plugin.rpcMethods["foo"]!.description.toLowerCase(),
          "an example of how register a RPC Method".toLowerCase());

      // We expect the deprecation of the plugin to be set as false by default
      expect(plugin.rpcMethods["foo"]!.deprecated, false);

      // We expect the long description of the plugin to be same as the description if not specified
      expect(plugin.rpcMethods["foo"]!.longDescription,
          plugin.rpcMethods["foo"]!.description);

      // We expect the usage of the plugin to be set as the string in the registerRPCMethod()
      expect(plugin.rpcMethods["foo"]!.usage.toLowerCase(),
          "this specifies the usage".toLowerCase());
    });
  });
}
