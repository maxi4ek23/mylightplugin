import 'package:flutter_test/flutter_test.dart';
import 'package:mylightplugin/mylightplugin.dart';
import 'package:mylightplugin/mylightplugin_platform_interface.dart';
import 'package:mylightplugin/mylightplugin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockMylightpluginPlatform
    with MockPlatformInterfaceMixin
    implements MylightpluginPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<int?> getBatteryLevel() {
    // TODO: implement getBatteryLevel
    throw UnimplementedError();
  }

  @override
  Future<void> turnOffLight() {
    // TODO: implement turnOffLight
    throw UnimplementedError();
  }

  @override
  Future<void> turnOnLight() {
    // TODO: implement turnOnLight
    throw UnimplementedError();
  }
}

void main() {
  final MylightpluginPlatform initialPlatform = MylightpluginPlatform.instance;

  test('$MethodChannelMylightplugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelMylightplugin>());
  });

  test('getPlatformVersion', () async {
    Mylightplugin mylightpluginPlugin = Mylightplugin();
    MockMylightpluginPlatform fakePlatform = MockMylightpluginPlatform();
    MylightpluginPlatform.instance = fakePlatform;

    expect(await mylightpluginPlugin.getPlatformVersion(), '42');
  });
}
