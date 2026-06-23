import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(
  PigeonOptions(
    dartOut: 'lib/src/messages.g.dart',
    swiftOut: 'ios/Classes/Messages.g.swift',
  ),
)
class DeviceInfo {
  String? deviceModel;
  String? osVersion;
}

@HostApi()
abstract class DeviceInfoHostApi {
  DeviceInfo getDeviceInfo();
}
