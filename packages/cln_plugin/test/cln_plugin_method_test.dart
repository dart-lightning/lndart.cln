import 'dart:convert';

import 'package:cln_plugin_api/src/cln_plugin_base.dart';
import 'package:test/test.dart';

void main() {
  group('Manifest test: ', () {
    test('Property test - dynamic', () {
      var plugin = Plugin(
          dynamic: true,
          onInit: (plugin) {
            return Future.value({});
          });
      // We set dynamic as true in the plugin initialization, let's test the property.
      expect(plugin.dynamic.runtimeType, bool);
      expect(plugin.dynamic, true);
    });
    test('Property test - rpcMethods', () async {
      var plugin = Plugin(
          dynamic: true,
          onInit: (plugin) {
            return Future.value({});
          });

      plugin.registerRPCMethod(
          name: "foo",
          usage: "this specifies the usage",
          description: "an example of how register a RPC Method",
          callback: (plugin, request) => Future.value(<String, Object>{
                "msg": "Hello",
                "language": "dart",
              }));
      // We added a RPC Method, we expect the class property rpcMethods to be non empty.
      expect(plugin.rpcMethods.isNotEmpty, true);

      // We expect the name of the plugin to be set as "foo"
      expect(plugin.rpcMethods["foo"]!.name.toLowerCase(), "foo");

      // We expect the description of the plugin to be set as the string in the registerRPCMethod()
      expect(plugin.rpcMethods["foo"]!.description.toLowerCase(),
          "an example of how register a RPC Method".toLowerCase());

      // We expect the deprecation of the plugin to be set as false by default
      expect(plugin.rpcMethods["foo"]!.deprecated, false);

      // We expect the usage of the plugin to be set as the string in the registerRPCMethod()
      expect(plugin.rpcMethods["foo"]!.usage.toLowerCase(),
          "this specifies the usage".toLowerCase());
    });

    test('Property test - options', () {
      var plugin = Plugin(
          dynamic: true,
          onInit: (plugin) {
            return Future.value({});
          });

      plugin.registerOption(
          name: 'greeting',
          type: 'string',
          def: "World",
          description: "What name should I call you?",
          deprecated: false);
      // We added a RPC Option, we expect the class property options to be non empty.
      expect(plugin.options.isNotEmpty, true);

      // We expect the name of the option to be set as "greeting"
      expect(plugin.options["greeting"]!.name, "greeting");

      // We expect the type of the option to be "string"
      expect(plugin.options["greeting"]!.type.toLowerCase(), "string");

      // We expect the default value of the option to be set as "World"
      expect(
          plugin.options["greeting"]!.def.toLowerCase(), "World".toLowerCase());

      // We expect the name of the option to be set as the string in the registerOption()
      expect(plugin.options["greeting"]!.description.toLowerCase(),
          "What name should I call you?".toLowerCase());

      // We expect the deprecation of the option to be false
      expect(plugin.options["greeting"]!.deprecated, false);
    });

    test('Property test - subscriptions', () async {
      Future<Map<String, Object>> notifyMethod(
          Plugin plugin, Map<String, Object> request) {
        plugin.log(level: 'debug', message: 'Notification received!');
        return Future.value({});
      }

      var plugin = Plugin(
          dynamic: true,
          onInit: (plugin) {
            return Future.value({});
          });

      plugin.registerSubscriptions(event: 'connect', callback: notifyMethod);
      // We added a Subscription, we expect the class property options to be non empty.
      expect(plugin.subscriptions.isNotEmpty, true);
    });

    test('getManifest() Test', () async {
      var plugin = Plugin(
          dynamic: true,
          onInit: (plugin) {
            return Future.value({});
          });
      // Adding an empty request and generating a manifest.
      var getManifest = await plugin.getManifest(plugin, {});

      expect(getManifest.containsKey('rpcmethods'), true);
      expect(getManifest.containsKey('options'), true);
      expect(getManifest.containsKey('notifications'), true);
      expect(getManifest.containsKey('dynamic'), true);
      expect(getManifest.containsKey('hooks'), true);
      expect(getManifest.containsKey('subscriptions'), true);

      expect(getManifest["rpcmethods"], isNotNull);
      expect(getManifest["options"], isNotNull);
      expect(getManifest["notifications"], isNotNull);
      expect(getManifest["dynamic"], isNotNull);
      expect(getManifest["hooks"], isNotNull);
      expect(getManifest["subscriptions"], isNotNull);
    });

    test('deep getManifest Test', () async {
      var plugin = Plugin(
          dynamic: true,
          onInit: (plugin) {
            return Future.value({});
          });
      plugin.registerHook(
          name: "rpc_command",
          callback: (plugin, request) {
            plugin.log(level: "info", message: "hook info");
            return Future(() => {"result": "continue"});
          });
      // Adding an empty request and generating a manifest.
      var getManifest = await plugin.getManifest(plugin, {});

      expect(getManifest.containsKey('hooks'), true);
      expect(getManifest["hooks"], isNotNull);
      var hooks = List.from(jsonDecode(jsonEncode(getManifest["hooks"])));
      expect(hooks.length, 1);
      expect(hooks[0]["name"], "rpc_command");
      expect(hooks[0]["before"], isNull);
      expect(hooks[0]["after"], isNull);
    });
  });
  group('Init test: ', () {
    test('Property test - option registered.', () {
      var plugin = Plugin(
          dynamic: true,
          onInit: (plugin) {
            return Future.value({});
          });
      var request = {
        "options": {
          "greeting": "World",
        },
        "configuration": {
          "lightning-dir": "/home/user/.lightning/testnet",
          "rpc-file": "lightning-rpc",
          "startup": true,
          "network": "testnet",
          "feature_set": {
            "init": "02aaa2",
            "node": "8000000002aaa2",
            "channel": "",
            "invoice": "028200"
          },
          "proxy": {"type": "ipv4", "address": "127.0.0.1", "port": 9050},
          "torv3-enabled": true,
          "always_use_proxy": false
        }
      };
      plugin.registerOption(
          name: 'greeting',
          type: 'string',
          def: 'World',
          description: 'This is the option description.');
      plugin.init(plugin, request);
      expect(plugin.options.containsKey('greeting'), true);
      expect(plugin.options["greeting"]!.name.toString(), "greeting");
      expect(plugin.options["greeting"]!.value.toString(), "World");
    });

    test('Property test - option not registered.', () {
      var plugin = Plugin(
          dynamic: true,
          onInit: (plugin) {
            return Future.value({});
          });
      var request = {
        "options": {"greeting": "World", "name": "Alibaba"},
        "configuration": {
          "lightning-dir": "/home/user/.lightning/testnet",
          "rpc-file": "lightning-rpc",
          "startup": true,
          "network": "testnet",
          "feature_set": {
            "init": "02aaa2",
            "node": "8000000002aaa2",
            "channel": "",
            "invoice": "028200"
          },
          "proxy": {"type": "ipv4", "address": "127.0.0.1", "port": 9050},
          "torv3-enabled": true,
          "always_use_proxy": false
        }
      };
      plugin.registerOption(
          name: 'greeting',
          type: 'string',
          def: 'World',
          description: 'This is the option description.');
      expect(() => plugin.init(plugin, request), throwsException);
      // Make sure that inside the exception message there is the option name
      // avoid to check the all message because the message can evolve in the time, but not the option name
      expect(
          () => plugin.init(plugin, request),
          throwsA(predicate(
              (e) => e is Exception && e.toString().contains("name"))));
    });
  });
}
