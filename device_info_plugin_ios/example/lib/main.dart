import 'package:flutter/material.dart';
import 'package:device_info_plugin_platform_interface/device_info_plugin_platform_interface.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DeviceInfo? _deviceInfo;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _loadDeviceInfo();
  }

  Future<void> _loadDeviceInfo() async {
    try {
      final info = await DeviceInfoPluginPlatform.instance.getDeviceInfo();
      if (mounted) {
        setState(() {
          _deviceInfo = info;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _errorMessage = e.toString();
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Device Info iOS Example'),
        ),
        body: Center(
          child: _errorMessage != null
              ? Text('Error: $_errorMessage', style: const TextStyle(color: Colors.red))
              : _deviceInfo == null
                  ? const CircularProgressIndicator()
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.apple, size: 64),
                        const SizedBox(height: 16),
                        Text(
                          'Model: ${_deviceInfo!.deviceModel}',
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'OS Version: ${_deviceInfo!.osVersion}',
                          style: const TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
        ),
      ),
    );
  }
}
