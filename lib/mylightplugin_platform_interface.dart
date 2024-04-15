import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'mylightplugin_method_channel.dart';

abstract class MylightpluginPlatform extends PlatformInterface {

  MylightpluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static MylightpluginPlatform _instance = MethodChannelMylightplugin();

  static MylightpluginPlatform get instance => _instance;

  static set instance(MylightpluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<void> turnOnLight() {
    throw UnimplementedError('turnOnLight() has not been implemented.');
  }

  Future<void> turnOffLight() {
    throw UnimplementedError('turnOffLight() has not been implemented.');
  }

  Future<int?> getBatteryLevel() {
    throw UnimplementedError('getBatteryLevel() has not been implemented.');
  }
}
