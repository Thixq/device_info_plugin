import 'package:device_info_plugin_platform_interface/device_info_plugin_method_channel.dart';
import 'package:device_info_plugin_platform_interface/device_info_plugin_platform_interface.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

/// {@template device_info_plugin_platform_interface.device_info_plugin_platform_interface}
/// The interface for the device info plugin.
/// {@endtemplate}
abstract class DeviceInfoPluginPlatform extends PlatformInterface {
  /// {@template device_info_plugin_platform_interface.device_info_plugin_platform_interface}
  /// The constructor for the device info plugin.
  /// {@endtemplate}
  DeviceInfoPluginPlatform() : super(token: _token);

  /// {@template device_info_plugin_platform_interface.device_info_plugin_platform_interface.token}
  /// The token for the device info plugin.
  /// {@endtemplate}
  static final Object _token = Object();

  /// {@template device_info_plugin_platform_interface.device_info_plugin_platform_interface.instance}
  /// The instance of the device info plugin.
  /// {@endtemplate}
  static DeviceInfoPluginPlatform _instance = DeviceInfoPluginMethodChannel();

  /// The instance of the device info plugin.
  static DeviceInfoPluginPlatform get instance => _instance;

  /// Sets the instance of the device info plugin.
  static set instance(DeviceInfoPluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  /// Returns the device information.
  Future<DeviceInfo?> getDeviceInfo() {
    throw UnimplementedError('getDeviceInfo() is not implemented.');
  }
}
