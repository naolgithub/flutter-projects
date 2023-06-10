import 'package:flutter/material.dart';

import 'health_status_page.dart';

class HomePage extends StatefulWidget {
  final TextEditingController nameController;
  final TextEditingController radiusController;
  const HomePage({
    required this.nameController,
    required this.radiusController,
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(
                height: 40,
              ),
              const Text(
                'Welcome to the smart herding system',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.cyan,
                ),
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
                  color: Colors.cyan,
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
                        color: Colors.cyan,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  MaterialButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const HealthStatusPage(),
                        ),
                      );
                    },
                    child: const Text(
                      'No,Continue',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.cyan,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
