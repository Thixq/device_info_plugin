import 'package:device_info_plugin_android/device_info_plugin_android.dart';
import 'package:device_info_plugin_android/src/messages.g.dart';
import 'package:device_info_plugin_platform_interface/device_info_plugin_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<DeviceInfoHostApi>()])
import 'device_info_plugin_android_test.mocks.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('DeviceInfoPluginAndroidPlugin', () {
    late DeviceInfoPluginAndroidPlugin plugin;
    late MockDeviceInfoHostApi mockHostApi;

    setUp(() {
      mockHostApi = MockDeviceInfoHostApi();
      // Inject the mock via the visibleForTesting constructor
      plugin = DeviceInfoPluginAndroidPlugin(hostApi: mockHostApi);
    });

    test('registers itself as the default platform interface', () {
      DeviceInfoPluginAndroidPlugin.registerWith();
      expect(
        DeviceInfoPluginPlatform.instance,
        isA<DeviceInfoPluginAndroidPlugin>(),
      );
    });

    test(
      'getDeviceInfo calls Pigeon API and maps response correctly',
      () async {
        // Arrange
        final mockPigeonData = DeviceInfoAndroid(
          deviceModel: 'Pixel 8',
          osVersion: '14',
        );
        when(
          mockHostApi.getDeviceInfo(),
        ).thenAnswer((_) async => mockPigeonData);

        // Act
        final result = await plugin.getDeviceInfo();

        // Assert
        expect(result?.deviceModel, 'Pixel 8');
        expect(result?.osVersion, '14');
        verify(mockHostApi.getDeviceInfo()).called(1);
      },
    );
  });
}
