
import 'mylightplugin_platform_interface.dart';

class Mylightplugin {
  Future<String?> getPlatformVersion() {
    return MylightpluginPlatform.instance.getPlatformVersion();
  }

  static Future<void> turnOnLight() {
    return MylightpluginPlatform.instance.turnOnLight();
  }

  static Future<void> turnOffLight() {
    return MylightpluginPlatform.instance.turnOffLight();
  }

  Future<int?> getBatteryLevel() {
    return MylightpluginPlatform.instance.getBatteryLevel();
  }
}
