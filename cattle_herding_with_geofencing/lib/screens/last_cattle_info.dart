import 'package:flutter/material.dart';

class LastCattleInfo extends StatefulWidget {
  final double temperature;
  final double heartBeatRate;
  final String position;
  const LastCattleInfo(
      {required this.temperature,
      required this.heartBeatRate,
      required this.position,
      super.key});

  @override
  State<LastCattleInfo> createState() => _LastCattleInfoState();
}

class _LastCattleInfoState extends State<LastCattleInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('cattle info'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('Temperature of cattle: $widget.temperature.toString()'),
            Text('HeartBeat Rate of cattle: $widget.heartBeatRate.toString()'),
            Text('Position of cattle: $widget.position.toString()'),
          ],
        ),
      ),
    );
  }
}
