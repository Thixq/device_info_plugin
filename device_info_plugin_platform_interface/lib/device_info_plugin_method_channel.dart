import 'package:device_info_plugin_platform_interface/device_info_plugin_platform_interface.dart';
import 'package:flutter/services.dart';

const MethodChannel _methodChannel = MethodChannel(
  'com.thixq.device_info_plugin',
);

/// A MethodChannel implementation of [DeviceInfoPluginPlatform].
final class DeviceInfoPluginMethodChannel extends DeviceInfoPluginPlatform {
  @override
  Future<DeviceInfo?> getDeviceInfo() async {
    final result = await _methodChannel.invokeMethod<Map<Object?, Object?>>(
      'getDeviceInfo',
    );
    if (result == null) return null;

    return DeviceInfo.fromJson(Map<String, dynamic>.from(result));
  }
}
