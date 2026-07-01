import Flutter
import UIKit

public class DeviceInfoPluginIosPlugin: NSObject, FlutterPlugin, DeviceInfoHostApi {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let instance = DeviceInfoPluginIosPlugin()
    // Setup Pigeon API using the generated setup class
    DeviceInfoHostApiSetup.setUp(binaryMessenger: registrar.messenger(), api: instance)
  }

  func getDeviceInfo() throws -> DeviceInfoIOS {
    // Get real iOS device information
    let deviceModel = UIDevice.current.model // e.g. "iPhone", "iPad"
    let osVersion = UIDevice.current.systemVersion // e.g. "17.4"
    
    // Return the Pigeon-generated data object
    return DeviceInfoIOS(deviceModel: deviceModel, osVersion: osVersion)
  }
}
