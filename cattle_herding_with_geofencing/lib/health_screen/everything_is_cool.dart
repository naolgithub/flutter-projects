import 'package:flutter/material.dart';

class EverythingIsCool extends StatefulWidget {
  const EverythingIsCool({super.key});

  @override
  State<EverythingIsCool> createState() => _EverythingIsCoolState();
}

class _EverythingIsCoolState extends State<EverythingIsCool> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.forward_5_rounded),
              onPressed: () {
                Navigator.of(context).pop();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        centerTitle: true,
        title: const Text(
          'Fine',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
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
      ),
    );
  }
}
