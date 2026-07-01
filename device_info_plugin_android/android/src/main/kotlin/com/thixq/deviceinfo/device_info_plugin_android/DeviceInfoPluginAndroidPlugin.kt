package com.thixq.deviceinfo.device_info_plugin_android

import android.os.Build
import io.flutter.embedding.engine.plugins.FlutterPlugin

/** DeviceInfoPluginAndroidPlugin */
class DeviceInfoPluginAndroidPlugin : FlutterPlugin, DeviceInfoHostApi {

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        DeviceInfoHostApi.setUp(flutterPluginBinding.binaryMessenger, this)
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        DeviceInfoHostApi.setUp(binding.binaryMessenger, null)
    }

    override fun getDeviceInfo(): DeviceInfoAndroid {
        return DeviceInfoAndroid(
            deviceModel = Build.MODEL,
            osVersion = Build.VERSION.RELEASE
        )
    }
}
