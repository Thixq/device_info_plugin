package com.example.device_info_plugin

import android.os.Build
import io.flutter.embedding.engine.plugins.FlutterPlugin

class DeviceInfoPlugin : FlutterPlugin, DeviceInfoHostApi {

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        DeviceInfoHostApi.setUp(flutterPluginBinding.binaryMessenger, this)
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        DeviceInfoHostApi.setUp(binding.binaryMessenger, null)
    }

    override fun getDeviceInfo(): DeviceInfoMessage {
        return DeviceInfoMessage(
            osVersion = "Android ${Build.VERSION.RELEASE}",
            deviceModel = Build.MODEL
        )
    }
}
