import 'dart:async';

import 'package:flutter/material.dart';

class TemperatureHeartBeatRatePositionPage extends StatefulWidget {
  final String cattleId;
  final String position;
  final String temperature;
  final String heartBeatRate;
  const TemperatureHeartBeatRatePositionPage({
    required this.cattleId,
    required this.heartBeatRate,
    required this.position,
    required this.temperature,
    super.key,
  });

  @override
  State<TemperatureHeartBeatRatePositionPage> createState() =>
      _TemperatureHeartBeatRatePositionPageState();
}

class _TemperatureHeartBeatRatePositionPageState
    extends State<TemperatureHeartBeatRatePositionPage> {
  double _fontSize = 16.0;
  Color _color = Colors.cyan;
  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (mounted) {
        setState(() {
          _fontSize = _fontSize == 16.0 ? 24.0 : 16.0;
          _color = _color == Colors.cyan ? Colors.red : Colors.cyan;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Temperature, HeartBeatRate & Position Problem'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 80),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              '''Temperature, HeartBeatRate & Position
            of cattle Id: 0003X is out of range''',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            // const SizedBox(
            //   height: 15,
            // ),
            // const Icon(
            //   Icons.heart_broken,
            //   color: Colors.red,
            //   weight: 3,
            // ),
            const SizedBox(
              height: 50,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                '''Look after its designated area and take this cattle to the doctor''',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            AnimatedDefaultTextStyle(
              style: TextStyle(
                color: _color,
                fontSize: _fontSize,
              ),
              duration: const Duration(milliseconds: 200),
              child: const Text(
                '👇',
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Flexible(
                      child: Image.asset('assets/images/cattle_herder.jpeg')),
                  const SizedBox(
                    width: 10,
                  ),
                  Flexible(child: Image.asset('assets/images/docc.jpeg')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
