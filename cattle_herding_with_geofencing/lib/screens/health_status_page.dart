import 'package:flutter/material.dart';

class HealthStatusPage extends StatefulWidget {
  const HealthStatusPage({super.key});

  @override
  State<HealthStatusPage> createState() => _HealthStatusPageState();
}

class _HealthStatusPageState extends State<HealthStatusPage> {
  late final double temperature;
  late final double heartBeat;
  late final double position;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          if (snapshot.hasData) {
            return const Text('data');
          }
          if (snapshot.hasError) {
            return Center(
              child: Text('$snapshot.error'),
            );
          }
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.lightBlue,
            ),
          );
        }
        return const Text('data');
      }),
    );
  }
}
