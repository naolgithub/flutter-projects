import 'dart:async';

import 'package:flutter/material.dart';

class EverythingIsCool extends StatefulWidget {
  const EverythingIsCool({super.key});

  @override
  State<EverythingIsCool> createState() => _EverythingIsCoolState();
}

class _EverythingIsCoolState extends State<EverythingIsCool> {
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
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/smile_faceTwo.jpeg'),
          const SizedBox(
            height: 60,
          ),
          const Text(
            '''    Be happy
everything is fine''',
            style: TextStyle(
              fontSize: 30,
              color: Colors.cyan,
            ),
          ),
        ],
      ),
    );
  }
}
