// TODO: Put public facing types in this file.

import 'dart:collection';
import 'dart:io';

import 'package:cln_plugin/src/rpcmethods/abstractrpcmethod.dart';
import 'package:cln_plugin/src/rpcmethods/manifest/types/option.dart';
import 'package:cln_plugin/src/rpcmethods/manifest/types/feature.dart';

import 'icln_plugin_base.dart';

class Plugin implements CLNPlugin {
  /// List of methods exposed
  late List<RPCMethod> rpcMethods;

  /// List of Subscriptions
  late List<String> subscriptions;

  /// List of Options
  late List<Option> options;

  /// List of Hooks
  late Set<String> hooks;

  /// FeatureBits for announcements of featurebits in protocol
  late Feature features;

  /// Boolean to mark dynamic management of plugin
  late bool dynamic = false;

  /// Custom notifications map
  late HashMap<String, Function> notifications;

  Plugin({bool dynamic = false}) {
    // Data member initializations
  }

  @override
  void start() {
    // This function will communicate with the rpc.
    try {
      String? messageSocket;
      while ((messageSocket = stdin.readLineSync()) != null) {
        // Already checked is stdin is not null, why trim and check again??
        if (messageSocket!.trim().isEmpty) {
          continue;
        }
      }
    } catch (error, stacktrace) {
      print('$error:$stacktrace');
    }
  }

  @override
  void registerFeature(
      {required String node,
      required String channel,
      required String init,
      required String invoice}) {
    features =
        Feature(node: node, channel: channel, init: init, invoice: invoice);
  }

  @override
  void registerRPCMethod(
      {required String name,
      required String usage,
      required String description,
      required Function callback}) {
    rpcMethods = RPCMethod(
        name: name,
        usage: usage,
        description: description,
        callback: callback) as List<RPCMethod>;
  }

  @override
  void registerOption(
      {required String name,
      required String type,
      required String def,
      required String description,
      required bool deprecated}) {
    options = Option(
        name: name,
        type: type,
        def: def,
        description: description,
        deprecated: deprecated) as List<Option>;
  }

  @override
  void registerSubscriptions({required String event}) {
    subscriptions.add(event);
  }

  @override
  void registerHook({required String name}) {
    hooks.add(name);
  }

  @override
  void registerNotification(
      {required String event, required Function onEvent}) {
    notifications.addAll({event: onEvent});
  }
}
