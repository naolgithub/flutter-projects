import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_fonts/google_fonts.dart';

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
      title: 'Using secure storage to store data',
      theme: ThemeData(
        textTheme: GoogleFonts.satisfyTextTheme(
          const TextTheme(
            bodyMedium: TextStyle(
              color: Colors.lightBlueAccent,
              fontSize: 30,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        appBarTheme: AppBarTheme(
          color: Colors.lightBlueAccent,
          centerTitle: true,
          elevation: 0,
          titleTextStyle: GoogleFonts.satisfy(
            fontSize: 30,
            fontStyle: FontStyle.italic,
            color: Colors.lightBlueAccent,
            fontWeight: FontWeight.bold,
          ),
        ),
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        useMaterial3: true,
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
  final TextEditingController _controller = TextEditingController();
  final storage = const FlutterSecureStorage();
  final myKey = 'myPass';
  String naol = '';

  Future writeToSecureStorage() async {
    await storage.write(
      key: myKey,
      value: _controller.text,
    );
  }

  Future<String?> readFromSecureStorage() async {
    naol = (await storage.read(key: myKey)).toString();
    return await storage.read(key: myKey);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Storing data using secure_storage',
          style: TextStyle(
            color: Colors.lightBlueAccent,
            fontSize: 35,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: 'Enter something ',
                isDense: true,
              ),
            ),
            ElevatedButton(
              child: const Text('Save Value'),
              onPressed: () {
                writeToSecureStorage();
              },
            ),
            ElevatedButton(
                child: const Text('Read Value'),
                onPressed: () {
                  readFromSecureStorage().then((value) {
                    setState(() {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: Text(naol.toString()),
                            );
                          });
                    });
                  });
                }),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
