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
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        centerTitle: true,
        title: const Text(
          'Everything is perfect',
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
