// ignore_for_file: document_ignores, one_member_abstracts

import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(
  PigeonOptions(
    dartOut: 'lib/src/messages.g.dart',
    dartPackageName: 'device_info_plugin_android',
    kotlinOut: 'android/src/main/kotlin/com/thixq/deviceinfo/device_info_plugin_android/Messages.g.kt',
    kotlinOptions: KotlinOptions(
      package: 'com.thixq.deviceinfo.device_info_plugin_android',
    ),
  ),
)
class DeviceInfoAndroid {
  String? deviceModel;
  String? osVersion;
}

@HostApi()
abstract class DeviceInfoHostApi {
  DeviceInfoAndroid getDeviceInfo();
}
