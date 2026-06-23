/// {@template device_info_plugin_platform_interface.device_info}
/// A data class representing the device information.
/// {@endtemplate}
class DeviceInfo {
  /// Creates a new [DeviceInfo] instance.
  const DeviceInfo({
    this.deviceModel,
    this.osVersion,
  });

  factory DeviceInfo.fromJson(Map<String, dynamic> json) {
    return DeviceInfo(
      deviceModel: json['deviceModel'] as String?,
      osVersion: json['osVersion'] as String?,
    );
  }

  /// The device model.
  final String? deviceModel;

  /// The operating system version.
  final String? osVersion;

  Map<String, dynamic> toJson() {
    return {
      'deviceModel': deviceModel,
      'osVersion': osVersion,
    };
  }

  @override
  String toString() {
    return 'DeviceInfo(deviceModel: $deviceModel, osVersion: $osVersion)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is DeviceInfo &&
        other.deviceModel == deviceModel &&
        other.osVersion == osVersion;
  }

  @override
  int get hashCode {
    return Object.hash(deviceModel, osVersion);
  }
}
