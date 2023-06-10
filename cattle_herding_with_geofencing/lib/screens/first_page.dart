import 'dart:async';

import 'package:cattle_herding_with_geofencing/screens/home_page.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
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
          _fontSize = _fontSize == 16.0 ? 24.0 : 16.0;
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
      // appBar: AppBar(
      //   backgroundColor: Colors.white70,
      //   title: const Text(
      //     'Smart Cattle Herding',
      //     style: TextStyle(
      //       color: Colors.cyan,
      //       fontSize: 30,
      //     ),
      //   ),
      // ),
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              // width: MediaQuery.of(context).size.width,
              width: double.infinity,
              // height: MediaQuery.of(context).size.height,
              height: double.infinity,
              child: Image.asset(
                'assets/images/backgroundImageTwo.jpeg',
                fit: BoxFit.cover,
              ),
            ),
            Column(
              children: [
                Container(
                  height: 200,
                  width: 200,
                  decoration: const BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.horizontal(),
                  ),
                  child: const Text(
                    r'Welcome to cattle herding system!',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                    ),
                  ),
                ),
                // const SizedBox(
                //   height: 10,
                // ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 3, horizontal: 5)
                          .copyWith(right: 10),
                  child: TextField(
                    controller: nameController,
                    onSubmitted: (value) {
                      nameOfCattleHerder = nameController.text;
                      nameController.clear();
                    },
                    decoration: const InputDecoration(
                      hintText: 'What is your cattle name ?',
                      hintStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
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
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
                  child: Stack(
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '''Please go to center of your designated area,
                            by taking powered device 👉''',
                            style: TextStyle(
                              color: Colors.lightBlue,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 10,
                              ),
                              child: AnimatedDefaultTextStyle(
                                style: TextStyle(
                                  fontSize: _fontSize,
                                  color: _color,
                                ),
                                duration: const Duration(microseconds: 200),
                                child: const Text(
                                  'I am at the center',
                                  style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 0.5,
                              ),
                              child: MaterialButton(
                                onPressed: () {},
                                child: AnimatedDefaultTextStyle(
                                  style: TextStyle(
                                    fontSize: _fontSize,
                                    color: _color,
                                  ),
                                  duration: const Duration(microseconds: 200),
                                  child: const Text(
                                    'Click Me',
                                    style: TextStyle(
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5)
                    .copyWith(
                  right: 100,
                  // left: 300,
                  bottom: 50,
                ),
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
            ),
          ],
        ),
      ),
    );
  }
}
