import 'package:device_info_plugin_platform_interface/device_info_plugin_method_channel.dart';
import 'package:device_info_plugin_platform_interface/device_info_plugin_platform_interface.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'device_info_plugin_platform_interface_test.mocks.dart';

// We must create a base class to mix in MockPlatformInterfaceMixin
// so that PlatformInterface.verifyToken() does not throw an AssertionError.
abstract class DeviceInfoPluginPlatformBase extends DeviceInfoPluginPlatform
    with MockPlatformInterfaceMixin {}

@GenerateNiceMocks([MockSpec<DeviceInfoPluginPlatformBase>()])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('DeviceInfoPluginPlatformInterface', () {
    late DeviceInfoPluginPlatform initialPlatform;

    setUp(() {
      initialPlatform = DeviceInfoPluginPlatform.instance;
    });

    test('default instance is DeviceInfoPluginMethodChannel', () {
      expect(initialPlatform, isInstanceOf<DeviceInfoPluginMethodChannel>());
    });

    test('can set mock instance and call getDeviceInfo', () async {
      final mockPlatform = MockDeviceInfoPluginPlatformBase();
      DeviceInfoPluginPlatform.instance = mockPlatform;

      when(mockPlatform.getDeviceInfo()).thenAnswer(
        (_) async => const DeviceInfo(
          deviceModel: 'iPhone 15 Pro',
          osVersion: '17.4',
        ),
      );

      final result = await DeviceInfoPluginPlatform.instance.getDeviceInfo();

      expect(result?.deviceModel, 'iPhone 15 Pro');
      expect(result?.osVersion, '17.4');
      verify(mockPlatform.getDeviceInfo()).called(1);
    });
  });

  group('DeviceInfoPluginMethodChannel', () {
    const channel = MethodChannel('com.thixq.device_info_plugin');
    final methodChannelInstance = DeviceInfoPluginMethodChannel();

    setUp(() {
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(
            channel,
            (methodCall) async {
              if (methodCall.method == 'getDeviceInfo') {
                // Return a Map as StandardMethodCodec expects
                return <String, String>{
                  'deviceModel': 'ChannelModel',
                  'osVersion': 'ChannelOS',
                };
              }
              return null;
            },
          );
    });

    tearDown(() {
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(channel, null);
    });

    test('getDeviceInfo calls correct method', () async {
      final result = await methodChannelInstance.getDeviceInfo();
      expect(result?.deviceModel, 'ChannelModel');
      expect(result?.osVersion, 'ChannelOS');
    });
  });
}
