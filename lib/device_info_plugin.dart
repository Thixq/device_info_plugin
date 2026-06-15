library;

import 'src/messages.g.dart';

class DeviceInfoPlugin {
  final DeviceInfoHostApi _api = DeviceInfoHostApi();

  Future<DeviceInfoMessage> getDeviceInfo() {
    return _api.getDeviceInfo();
  }
}
