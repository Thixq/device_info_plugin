import 'package:device_info_plugin_ios/device_info_plugin_ios.dart';
import 'package:device_info_plugin_ios/src/messages.g.dart';
import 'package:device_info_plugin_platform_interface/device_info_plugin_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<DeviceInfoHostApi>()])
import 'device_info_plugin_ios_test.mocks.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('DeviceInfoPluginIosPlugin', () {
    late DeviceInfoPluginIosPlugin plugin;
    late MockDeviceInfoHostApi mockHostApi;

    setUp(() {
      mockHostApi = MockDeviceInfoHostApi();
      // Inject the mock via the visibleForTesting constructor
      plugin = DeviceInfoPluginIosPlugin(hostApi: mockHostApi);
    });

    test('registers itself as the default platform interface', () {
      DeviceInfoPluginIosPlugin.registerWith();
      expect(
        DeviceInfoPluginPlatform.instance,
        isA<DeviceInfoPluginIosPlugin>(),
      );
    });

    test(
      'getDeviceInfo calls Pigeon API and maps response correctly',
      () async {
        // Arrange
        final mockPigeonData = DeviceInfoIOS(
          deviceModel: 'iPhone 15 Pro',
          osVersion: '17.4.1',
        );
        when(
          mockHostApi.getDeviceInfo(),
        ).thenAnswer((_) async => mockPigeonData);

        // Act
        final result = await plugin.getDeviceInfo();

        // Assert
        expect(result?.deviceModel, 'iPhone 15 Pro');
        expect(result?.osVersion, '17.4.1');
        verify(mockHostApi.getDeviceInfo()).called(1);
      },
    );
  });
}
