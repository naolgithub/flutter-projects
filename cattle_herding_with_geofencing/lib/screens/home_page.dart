import 'package:flutter/material.dart';

import 'health_status_page.dart';

class HomePage extends StatefulWidget {
  final String latitudeController;
  final String lontitudeController;
  final String radiusController;
  const HomePage({
    required this.latitudeController,
    required this.radiusController,
    required this.lontitudeController,
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // send() {
  //   Navigator.of(context).push(
  //     MaterialPageRoute(
  //       builder: (context) => const HealthStatusPage(),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.arrow_back_ios),
                  ),
                ),
                const Text(
                  'Welcome to smart herding system',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 400,
              width: double.infinity,
              child: Image.asset(
                'assets/images/backgroundImageOne.jpeg',
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            const Text(
              'Do you want to change your grazing yard ?',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MaterialButton(
                  onPressed: () {},
                  child: const Text(
                    'Yes,Find another spot',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                MaterialButton(
                  onPressed: () {
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //     builder: (context) => const HealthStatusPage(),
                    //   ),
                    // );
                    // send();
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => HealthStatusPage(
                          latitudeController: widget.latitudeController,
                          lontitudeController: widget.lontitudeController,
                          radiusController: widget.radiusController,
                        ),
                      ),
                    );
                  },
                  child: const Text(
                    'No,Continue',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
