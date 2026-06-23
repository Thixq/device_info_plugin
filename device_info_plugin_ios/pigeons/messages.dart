// ignore_for_file: document_ignores, one_member_abstracts

import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(
  PigeonOptions(
    dartOut: 'lib/src/messages.g.dart',
    swiftOut: 'ios/Classes/Messages.g.swift',
  ),
)
class DeviceInfoIOS {
  String? deviceModel;
  String? osVersion;
}

@HostApi()
abstract class DeviceInfoHostApi {
  DeviceInfoIOS getDeviceInfo();
}
