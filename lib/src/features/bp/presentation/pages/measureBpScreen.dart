import 'dart:async';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

List<CameraDescription>? cameras;

class MeasureBpScreen extends StatefulWidget {
  @override
  _MeasureBpScreenState createState() => _MeasureBpScreenState();
}

class _MeasureBpScreenState extends State<MeasureBpScreen> {
  CameraController? controller;
  bool isMeasuring = false;
  Timer? _timer;
  List<int> heartRates = [];

  @override
  void initState() {
    super.initState();
    initializeCamera();
  }

  Future<void> initializeCamera() async {
    cameras = await availableCameras();
    controller = CameraController(cameras![0], ResolutionPreset.low);
    await controller?.initialize();
    controller?.setFlashMode(FlashMode.torch); // Enable flash (torch mode)
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    _timer?.cancel();
    super.dispose();
  }

  void startMeasurement() {
    setState(() {
      isMeasuring = true;
      heartRates.clear();
    });

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      // Simulate heart rate measurement (you need to implement the logic)
      int simulatedHeartRate = 60 + heartRates.length; // Simulating data
      heartRates.add(simulatedHeartRate);

      if (heartRates.length >= 10) {
        stopMeasurement();
      }
    });
  }

  void stopMeasurement() {
    _timer?.cancel();
    setState(() {
      isMeasuring = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blood Pressure Measurement'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (controller != null && controller!.value.isInitialized)
            AspectRatio(
              aspectRatio: controller!.value.aspectRatio,
              child: CameraPreview(controller!),
            ),
          const SizedBox(height: 20),
          isMeasuring
              ? const Text('Measuring heart rate...')
              : ElevatedButton(
                  onPressed: startMeasurement,
                  child: const Text('Start Measurement'),
                ),
          const SizedBox(height: 20),
          if (heartRates.isNotEmpty) Text('Heart Rate: ${heartRates.last} bpm'),
        ],
      ),
    );
  }
}
