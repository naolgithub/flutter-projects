import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class Naolaa extends StatefulWidget {
  const Naolaa({super.key});

  @override
  State<Naolaa> createState() => _NaolaaState();
}

class _NaolaaState extends State<Naolaa> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController radiusController = TextEditingController();
  String nameOfCattleHerder = '';
  double _fontSize = 16.0;
  Color _color = Colors.cyan;
  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (mounted) {
        setState(() {
          _fontSize = _fontSize == 20.0 ? 22.0 : 16.0;
          _color = _color == Colors.cyan ? Colors.lightGreen : Colors.cyan;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    radiusController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                child: Text(
                  'Welcome to cattle herding system',
                  style: TextStyle(
                    fontSize: 27,
                    color: Colors.lightBlue,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 25, horizontal: 15),
                child: TextField(
                  controller: nameController,
                  onSubmitted: (value) {
                    nameOfCattleHerder = nameController.text;
                    nameController.clear();
                  },
                  decoration: const InputDecoration(
                    hintText: 'What is your cattle name ?',
                    hintStyle: TextStyle(
                      color: Colors.lightBlue,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.horizontal(
                        right: Radius.circular(20),
                        left: Radius.circular(5),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  '''Please go to center of your designated area,
                 by taking powered device''',
                  style: TextStyle(
                    color: Colors.lightBlue,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  '''👇''',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontSize: 40,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: ZoomIn(
                  duration: const Duration(milliseconds: 200),
                  child: MaterialButton(
                    onPressed: () {},
                    child: const Text(
                      '''Set designated area''',
                      //  '''Click designated area''',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        color: Colors.deepPurpleAccent,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
                child: TextField(
                    controller: radiusController,
                    focusNode: FocusNode(),
                    decoration: const InputDecoration(
                      hintText: 'Please enter the radius of your area',
                      hintStyle: TextStyle(
                        color: Colors.cyan,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.horizontal(
                          right: Radius.circular(20),
                          left: Radius.circular(5),
                        ),
                      ),
                    ),
                    onSubmitted: (value) {
                      radiusController.clear();
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return HomePage(
                            radiusController: radiusController,
                            nameController: nameController,
                          );
                        },
                      ));
                    }),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric().copyWith(right: 20),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: MaterialButton(
                    onPressed: () {},
                    child: const Text(
                      'Submit',
                      style: TextStyle(
                        color: Colors.lightBlue,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
