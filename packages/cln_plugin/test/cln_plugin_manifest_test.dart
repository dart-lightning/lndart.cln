import 'package:cln_plugin/src/cln_plugin_base.dart';
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
    test('Property test - rpcMethods', () async {
    // Create also the plugin there :)
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

    
    test('Property test - options', () async {
    // create the plugin here too
    
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
  });
}
