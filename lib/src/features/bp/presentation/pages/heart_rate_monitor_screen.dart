import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:nishauri/src/features/bp/presentation/widgets/heart_rate_chart.dart';
import 'package:nishauri/src/shared/display/CustomeAppBar.dart';
import 'package:nishauri/src/utils/constants.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

class HeartRateMonitorScreen extends StatefulWidget {
  const HeartRateMonitorScreen({super.key});

  @override
  State<HeartRateMonitorScreen> createState() => _HeartRateMonitorScreenState();
}

class _HeartRateMonitorScreenState extends State<HeartRateMonitorScreen> {
  bool _isToggled = false;
  CameraController? _controller;
  final double _alpha = 0.3;
  bool _processing = false;
  final List<SensorValue> _data = [];
  double bpm = 0;
  final int _bpmReadingDuration = 30;

  @override
  void initState() {
    super.initState();
  }

  _toggle() {
    _initController().then((onValue) {
      WakelockPlus.enable();
      setState(() {
        _isToggled = true;
        _processing = false;
      });
      _startBPMCalculation();
    });
  }

  _unToggle() {
    _disposeController();
    WakelockPlus.disable();
    setState(() {
      _isToggled = false;
      _processing = false;
    });
  }

  Future<void> _initController() async {
    try {
      List cameras = await availableCameras();
      _controller = CameraController(cameras.first, ResolutionPreset.low);
      await _controller!.initialize();
      Future.delayed(const Duration(milliseconds: 500)).then((onValue) {
        _controller?.setFlashMode(FlashMode.torch);
      });
      _controller?.startImageStream((CameraImage image) {
        if (!_processing) {
          setState(() {
            _processing = true;
          });
          _scanImage(image);
        }
      });
    } catch (e) {
      debugPrint(e as String?);
    }
  }

  _scanImage(CameraImage image) {
    double avg =
        image.planes.first.bytes.reduce((value, element) => value + element) /
            image.planes.first.bytes.length;
    if (_data.length >= 50) {
      _data.removeAt(0);
    }
    setState(() {
      _data.add(SensorValue(DateTime.now(), avg));
    });
    Future.delayed(const Duration(milliseconds: 1000 ~/ 30)).then((onValue) {
      setState(() {
        _processing = false;
      });
    });
  }

  _disposeController() {
    _controller?.dispose();
    _controller = null;
  }

  _startBPMCalculation() async {
    List<SensorValue> values;
    double avg;
    int n;
    double m;
    double threshold;
    int counter;
    int previous;

    // Timer for 30 seconds to finish calculation
    Future.delayed(Duration(seconds: _bpmReadingDuration), () {
      _showBPMResult();
      _unToggle();
    });

    while (_isToggled) {
      values = List.from(_data);
      avg = 0;
      n = values.length;
      m = 0;
      for (var value in values) {
        avg += value.value / n;
        if (value.value > m) m = value.value;
      }
      threshold = (m + avg) / 2;
      bpm = 0;
      counter = 0;
      previous = 0;
      for (int i = 1; i < n; i++) {
        if (values[i - 1].value < threshold && values[i].value > threshold) {
          if (previous != 0) {
            counter++;
            bpm += 60000 / (values[i].time.millisecondsSinceEpoch - previous);
          }
          previous = values[i].time.millisecondsSinceEpoch;
        }
      }
      if (counter > 0) {
        bpm = bpm / counter;
        setState(() {
          bpm = (1 - _alpha) * bpm + _alpha * bpm;
        });
      }
      await Future.delayed(Duration(milliseconds: (1000 * 50 / 30).round()));
    }
  }

  // Function to show BPM result in a dialog
  void _showBPMResult() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("BPM Result"),
          content: Text("Your average BPM is ${bpm.round()}"),
          actions: <Widget>[
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _disposeController();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          const CustomAppBar(
            title: "Heart rate monitor 📈",
            subTitle: "",
            color: Constants.bpBgColor,
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Center(
                    child:
                        _controller != null && _controller!.value.isInitialized
                            ? CameraPreview(_controller!)
                            : const Text(
                                'Press start to begin measurement',
                                textAlign: TextAlign.center,
                              ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      "BPM: ${bpm.round()}",
                      style: const TextStyle(
                          fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: TextButton(
                onPressed: _isToggled ? _unToggle : _toggle,

                // iconSize: 128,
                style: ButtonStyle(
                  shape: WidgetStateProperty.all(
                    const CircleBorder(),
                  ),
                  padding: WidgetStateProperty.all(
                    const EdgeInsets.all(32),
                  ),
                  textStyle: WidgetStateProperty.all(
                    const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                child: Text(
                  _isToggled ? 'Stop' : 'Start',
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(12),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(18),
                ),
                color: Colors.black,
              ),
              child: HeartRateChart(_data),
            ),
          ),
        ],
      ),
    );
  }
}
