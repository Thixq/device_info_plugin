import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:device_info_plugin/device_info_plugin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _osVersion = 'Unknown';
  String _deviceModel = 'Unknown';
  final _deviceInfoPlugin = DeviceInfoPlugin();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String osVersion;
    String deviceModel;
    try {
      final info = await _deviceInfoPlugin.getDeviceInfo();
      osVersion = info.osVersion ?? 'Unknown OS version';
      deviceModel = info.deviceModel ?? 'Unknown device model';
    } on PlatformException {
      osVersion = 'Failed to get OS version.';
      deviceModel = 'Failed to get device model.';
    }

    if (!mounted) return;

    setState(() {
      _osVersion = osVersion;
      _deviceModel = deviceModel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Device Info Plugin Example')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('OS Version: $_osVersion'),
              Text('Device Model: $_deviceModel'),
            ],
          ),
        ),
      ),
    );
  }
}
