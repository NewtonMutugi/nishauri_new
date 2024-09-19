import 'dart:async';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

List<CameraDescription>? cameras;

class MeasureBpScreen extends StatefulWidget {
  @override
  _MeasureBpScreenState createState() => _MeasureBpScreenState();
}

class _MeasureBpScreenState extends State<MeasureBpScreen> {
  CameraController? controller;
  bool isMeasuring = false;
  Timer? _timer;
  List<double> redIntensityValues = [];
  int heartRate = 0;
  bool fingerDetected = false;
  bool isProcessing = false;

  @override
  void initState() {
    super.initState();
    initializeCamera();
  }

  Future<void> initializeCamera() async {
    try {
      cameras = await availableCameras();
      controller = CameraController(cameras![0], ResolutionPreset.low);
      await controller?.initialize();
      controller?.setFlashMode(FlashMode.torch); // Enable flash (torch mode)
      if (mounted) {
        setState(() {});
      }
    } on CameraException catch (e) {
      print('Error initializing camera: $e');
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
      redIntensityValues.clear();
      heartRate = 0;
      fingerDetected = false;
      isProcessing = true;
    });
    controller?.setFlashMode(FlashMode.torch);

    // Start capturing frames from the camera
    controller?.startImageStream((CameraImage image) {
      double redIntensity = calculateRedIntensity(image);
      redIntensityValues.add(redIntensity);

      // Check if finger is detected by analyzing red intensity levels
      if (!fingerDetected && isFingerOnCamera()) {
        setState(() {
          fingerDetected = true;
        });
      }

      // Update heart rate every 10 seconds (enough data for calculation)
      if (fingerDetected && redIntensityValues.length > 100) {
        calculateHeartRate();
      }
    });

    // Stop after 10 seconds
    _timer = Timer(const Duration(seconds: 10), () {
      stopMeasurement();
    });
  }

  void stopMeasurement() {
    controller?.stopImageStream();
    _timer?.cancel();
    setState(() {
      isMeasuring = false;
      redIntensityValues.clear();
      isProcessing = false;
    });
  }

  // Calculate red intensity from the camera image (assuming YUV420 format)
  double calculateRedIntensity(CameraImage image) {
    final yPlane = image.planes[0];
    int totalLuminance = 0;
    int pixelCount = yPlane.bytes.length;

    for (int i = 0; i < pixelCount; i++) {
      totalLuminance += yPlane.bytes[i];
    }

    return totalLuminance / pixelCount;
  }

  // Determine if a finger is placed on the camera based on red intensity
  bool isFingerOnCamera() {
    if (redIntensityValues.isEmpty) return false;

    // Use an average threshold for detecting finger placement
    double averageRedIntensity = redIntensityValues.last;
    return averageRedIntensity > 150; // Example threshold (adjust as needed)
  }

  // Calculate heart rate based on peaks in red intensity values
  void calculateHeartRate() {
    int peakCount = 0;
    for (int i = 1; i < redIntensityValues.length - 1; i++) {
      debugPrint("Red intesity values: ${redIntensityValues[i]}");
      if (redIntensityValues[i] > redIntensityValues[i - 1] &&
          redIntensityValues[i] > redIntensityValues[i + 1]) {
        peakCount++;
      }
    }

    heartRate = peakCount * 6; // Convert peaks to bpm

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Measure Heart Rate'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (controller != null && controller!.value.isInitialized)
              AspectRatio(
                aspectRatio: controller!.value.aspectRatio,
                child: Stack(
                  children: [
                    CameraPreview(controller!),
                    if (!fingerDetected)
                      Center(
                        child: Container(
                          color: Colors.black.withOpacity(0.5),
                          padding: const EdgeInsets.all(8.0),
                          child: const Text(
                            'Place your finger on the camera lens',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            const SizedBox(height: 20),
            isMeasuring
                ? fingerDetected
                    ? const Column(
                        children: [
                          CircularProgressIndicator(),
                          SizedBox(height: 10),
                          Text('Measuring heart rate...'),
                        ],
                      )
                    : const Text('Detecting finger placement...')
                : ElevatedButton(
                    onPressed: startMeasurement,
                    child: const Text('Start Measurement'),
                  ),
            const SizedBox(height: 20),
            if (heartRate > 0)
              Text(
                'Heart Rate: $heartRate bpm',
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            if (!isMeasuring && !fingerDetected && !isProcessing)
              const Text(
                'Place your finger on the camera and press "Start"',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
          ],
        ),
      ),
    );
  }
}
