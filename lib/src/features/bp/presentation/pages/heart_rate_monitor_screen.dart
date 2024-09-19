import 'package:flutter/material.dart';

class HeartRateMonitorScreen extends StatefulWidget {
  const HeartRateMonitorScreen({super.key});

  @override
  State<HeartRateMonitorScreen> createState() => _HeartRateMonitorScreenState();
}

class _HeartRateMonitorScreenState extends State<HeartRateMonitorScreen> {
  bool _isToggled = false;

  void _toggle() {
    setState(() {
      _isToggled = true;
    });
  }

  void _unToggle() {
    setState(() {
      _isToggled = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              color: Colors.red,
            ),
          ),
          Expanded(
            child: Center(
              child: IconButton(
                onPressed: _isToggled ? _unToggle : _toggle,
                icon: Icon(
                  _isToggled ? Icons.favorite : Icons.favorite_border,
                ),
                color: Colors.red,
                iconSize: 128,
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
            ),
          ),
        ],
      )),
    );
  }
}
