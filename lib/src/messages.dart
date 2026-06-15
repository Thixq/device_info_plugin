import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(
  PigeonOptions(
    dartPackageName: 'device_info_plugin',
    input: 'lib/src/messages.dart',
    dartOut: 'lib/src/messages.g.dart',
    dartOptions: DartOptions(),
    kotlinOut:
        'android/src/main/kotlin/com/example/device_info_plugin/Messages.g.kt',
    kotlinOptions: KotlinOptions(package: 'com.example.device_info_plugin'),
    swiftOut: 'ios/Classes/Messages.g.swift',
    swiftOptions: SwiftOptions(),
  ),
)
// Taşınacak verinin tip güvenli modeli
class DeviceInfoMessage {
  String? osVersion;
  String? deviceModel;
}

// Flutter'dan Native'e (Yerel) çağrılacak metotlar
@HostApi()
abstract class DeviceInfoHostApi {
  DeviceInfoMessage getDeviceInfo();
}
