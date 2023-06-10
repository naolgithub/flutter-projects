import 'dart:async';

import 'package:flutter/material.dart';

class TemperaturePositionPage extends StatefulWidget {
  final String cattleId;
  final String position;
  final String temperature;
  const TemperaturePositionPage({
    required this.cattleId,
    required this.position,
    required this.temperature,
    super.key,
  });

  @override
  State<TemperaturePositionPage> createState() =>
      _TemperaturePositionPageState();
}

class _TemperaturePositionPageState extends State<TemperaturePositionPage> {
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
        title: const Text('Temperature & Position Problem'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 80),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              '''Temperature & Position
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
            const Text(
              '''Take this cattle to the doctor''',
              style: TextStyle(
                fontSize: 20,
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
