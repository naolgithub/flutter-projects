import 'dart:async';

import 'package:flutter/material.dart';

class Temperature extends StatefulWidget {
  const Temperature({super.key});

  @override
  State<Temperature> createState() => _TemperatureState();
}

class _TemperatureState extends State<Temperature> {
  double _fontSize = 16.0;
  Color _color = Colors.cyan;
  @override
  void initState() {
    super.initState();
    // getCattleData();
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
        title: const Text('Temperature Problem'),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 80),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "It is not a normal temperature for an healthy cattle, better visiting a doctor",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Icon(
                  Icons.emergency,
                  color: Colors.red,
                  weight: 83,
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'Take this cow to the doctor',
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
                Image.asset('assets/images/docc.jpeg'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
