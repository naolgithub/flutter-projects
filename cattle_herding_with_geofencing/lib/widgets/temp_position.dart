import 'dart:async';

import 'package:flutter/material.dart';

class TempPosition extends StatefulWidget {
  const TempPosition({super.key});

  @override
  State<TempPosition> createState() => _TempPositionState();
}

class _TempPositionState extends State<TempPosition> {
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
        title: const Text('Temperature & Position Problem'),
        leading: MaterialButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 80),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                '''It is not a normal temperature for an healthy cattle,
                 better visiting a doctor.
                 Plus, the cattle is not within designated area.
                 ''',
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
      ),
    );
  }
}
