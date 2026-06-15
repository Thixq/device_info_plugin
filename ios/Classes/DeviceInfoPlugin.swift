import Flutter
import UIKit

public class DeviceInfoPlugin: NSObject, FlutterPlugin, DeviceInfoHostApi {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let messenger = registrar.messenger()
    let api = DeviceInfoPlugin()
    DeviceInfoHostApiSetup.setUp(binaryMessenger: messenger, api: api)
  }

  func getDeviceInfo() throws -> DeviceInfoMessage {
    var message = DeviceInfoMessage()
    message.osVersion = "iOS " + UIDevice.current.systemVersion
    message.deviceModel = UIDevice.current.model
    return message
  }
}
