import 'package:device_info_plugin_android/src/messages.g.dart';
import 'package:device_info_plugin_platform_interface/device_info_plugin_platform_interface.dart';
import 'package:flutter/foundation.dart';

/// The Android implementation of [DeviceInfoPluginPlatform].
final class DeviceInfoPluginAndroidPlugin extends DeviceInfoPluginPlatform {
  /// Creates a new instance of [DeviceInfoPluginAndroidPlugin].
  DeviceInfoPluginAndroidPlugin({@visibleForTesting DeviceInfoHostApi? hostApi})
    : _hostApi = hostApi ?? DeviceInfoHostApi();

  final DeviceInfoHostApi _hostApi;

  /// Registers this class
  ///  as the default instance of [DeviceInfoPluginPlatform].
  static void registerWith() {
    DeviceInfoPluginPlatform.instance = DeviceInfoPluginAndroidPlugin();
  }

  /// Returns the Android device information.
  @override
  Future<DeviceInfo?> getDeviceInfo() async {
    final result = await _hostApi.getDeviceInfo();

    return DeviceInfo(
      deviceModel: result.deviceModel,
      osVersion: result.osVersion,
    );
  }
}
