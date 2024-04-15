import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'mylightplugin_platform_interface.dart';

/// An implementation of [MylightpluginPlatform] that uses method channels.
class MethodChannelMylightplugin extends MylightpluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('mylightplugin');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<void> turnOnLight() async {
    try {
      await methodChannel.invokeMethod<void>('turnOnLight');
    } on PlatformException catch (e) {
      throw 'Failed to turn on light: ${e.message}';
    }
  }

  @override
  Future<void> turnOffLight() async {
    try {
      await methodChannel.invokeMethod<void>('turnOffLight');
    } on PlatformException catch (e) {
      throw 'Failed to turn off light: ${e.message}';
    }
  }

  @override
  Future<int?> getBatteryLevel() async {
    final batteryLevel = await methodChannel.invokeMethod<int?>('getBatteryLevel');
    return batteryLevel;
  }
}
