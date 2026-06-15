import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:device_info_plugin/device_info_plugin.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('getDeviceInfo test', (WidgetTester tester) async {
    final DeviceInfoPlugin plugin = DeviceInfoPlugin();
    final info = await plugin.getDeviceInfo();
    
    // The device info depends on the host platform running the test, so
    // just assert that some non-empty string is returned.
    expect(info.osVersion?.isNotEmpty, true);
    expect(info.deviceModel?.isNotEmpty, true);
  });
}
