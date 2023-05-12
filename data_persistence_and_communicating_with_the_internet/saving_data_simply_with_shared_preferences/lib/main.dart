import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Saving data using sharedPreferences',
      theme: ThemeData(
        textTheme: GoogleFonts.satisfyTextTheme(
          const TextTheme(
            bodyMedium: TextStyle(
              color: Colors.lightBlueAccent,
              fontStyle: FontStyle.italic,
              fontFamily: 'italics',
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int appCounter = 1;

  @override
  void initState() {
    readAndWritePreference();
    super.initState();
  }

  /*
  You shouldn't use shared_preferences for critical data as 
  data stored there is not encrypted, and 
  writes are not always guaranteed.

  At its core, SharedPreferences stores key-value pairs on disk. 
  More specifically, only primitive data can be 
  saved: numbers, booleans Strings, and stringLists. 
  All data is saved within the app.
  */
  Future readAndWritePreference() async {
    //The getInstance() method returns a Future<SharedPreferences>,
    //so you should always treat this asynchronously
    SharedPreferences prefs = await SharedPreferences.getInstance();
    appCounter = prefs.getInt('appCounter')!;
    if (appCounter == 0) {
      appCounter = 1;
    } else {
      appCounter++;
    }
    /*
      The prefs.setInt('appCounter',appCounter) instruction 
      writes in a key named appCounter with an integer value of appCounter. 
      If the key does not exist, it gets created; 
      otherwise, you just overwrite its value.
      */
    await prefs.setInt('appCounter', appCounter);
    setState(() {
      appCounter = appCounter;
    });
  }

  Future deletePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //This deletes all the keys and values for the app.
    await prefs.clear();
    setState(() {
      appCounter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Saving data using sharedPreferences',
          style: TextStyle(
            color: Color.fromARGB(255, 27, 3, 244),
            fontStyle: FontStyle.italic,
            fontSize: 35,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'You have opened the app $appCounter times.',
            ),
            ElevatedButton(
              onPressed: () {
                deletePreference();
              },
              child: const Text(
                'Reset counter',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
