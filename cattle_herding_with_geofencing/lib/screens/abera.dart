import 'dart:async';

import 'package:cattle_herding_with_geofencing/screens/health_status_page.dart';
import 'package:flutter/material.dart';

class Abera extends StatefulWidget {
  const Abera({super.key});

  @override
  State<Abera> createState() => _AberaState();
}

class _AberaState extends State<Abera> {
  final TextEditingController latitudeController = TextEditingController();
  final TextEditingController longtitudeController = TextEditingController();
  final TextEditingController radiusController = TextEditingController();

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
    latitudeController.dispose();
    longtitudeController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                  child: Text(
                    'Welcome to cattle herding system',
                    style: TextStyle(
                      fontSize: 27,
                      color: Colors.black,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 25, horizontal: 15),
                  child: TextField(
                    controller: latitudeController,
                    onSubmitted: (value) {
                      // nameController.clear();
                    },
                    decoration: const InputDecoration(
                      hintText: 'What is your center of latitude ?',
                      hintStyle: TextStyle(
                        color: Colors.black,
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
                  height: 50,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 25, horizontal: 15),
                  child: TextField(
                    controller: longtitudeController,
                    onSubmitted: (value) {},
                    decoration: const InputDecoration(
                      hintText: 'What is your center of longtitude ?',
                      hintStyle: TextStyle(
                        color: Colors.black,
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
                  height: 50,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Text(
                    '''This is cattle's field''',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Text(
                    '''👇''',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      fontSize: 50,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 5),
                //   child: ZoomIn(
                //     duration: const Duration(milliseconds: 200),
                //     child: MaterialButton(
                //       onPressed: () {},
                //       child: const Text(
                //         // '''Set designated area''',
                //         '''Click designated area''',
                //         style: TextStyle(
                //           fontWeight: FontWeight.bold,
                //           fontStyle: FontStyle.italic,
                //           color: Colors.white,
                //           fontSize: 20,
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
                  child: TextField(
                    controller: radiusController,
                    focusNode: FocusNode(),
                    decoration: const InputDecoration(
                      hintText: 'Please enter the radius of your area',
                      hintStyle: TextStyle(
                        color: Colors.black,
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
                      // radiusController.clear();
                      // Navigator.of(context).push(MaterialPageRoute(
                      //   builder: (context) {
                      //     return HealthStatusPage(
                      //       radiusController: radiusController.text,
                      //       lontitudeController: longtitudeController.text,
                      //       latitudeController: latitudeController.text,
                      //     );
                      //   },
                      // ));
                    },
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric().copyWith(right: 20),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => HealthStatusPage(
                                    radiusController: radiusController.text,
                                    lontitudeController:
                                        longtitudeController.text,
                                    latitudeController: latitudeController.text,
                                  )),
                        );
                      },
                      child: const Text(
                        'Submit',
                        style: TextStyle(
                          color: Colors.white,
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
        ],
      ),
    ));
  }
}
