import 'dart:async';

import 'package:flutter/material.dart';

class PositionPage extends StatefulWidget {
  final String cattleId;
  final String position;
  const PositionPage({
    required this.cattleId,
    required this.position,
    super.key,
  });

  @override
  State<PositionPage> createState() => _PositionPageState();
}

class _PositionPageState extends State<PositionPage> {
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
        title: const Text(
          'Out of designated area',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 80),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Cattle Id: 0003X is out of designated area',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Icon(
                Icons.gps_fixed,
                color: Colors.red,
                weight: 3,
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Return the cattle to its designated area',
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
              Image.asset('assets/images/cattle_herder.jpeg'),
            ],
          ),
        ),
      ),
    );
  }
}
