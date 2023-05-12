import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Accessing the fileSystem/ working with directoris',
      theme: ThemeData(
        textTheme: GoogleFonts.satisfyTextTheme(
          const TextTheme(
            bodyMedium: TextStyle(
              color: Colors.lightBlueAccent,
              fontSize: 29,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        useMaterial3: true,
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
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

/*
    path_provider retrieves the documents folder in the device.
    The dart:io library to create a new file, 
    write content, and read its content.


    Now, you might be wondering, why do you need to use 
    path_provider to get the documents folder, and not just write anywhere?

    ANSWER: Local drives in iOS and Android are mostly inaccessible 
    to apps as a security measure. 
    Apps can only write to select folders, and those include 
    the temp and documents folders.


    When dealing with files, you need to do the following:
    1. Get a reference to the file. 
    2. Write some content.
    3. Read the file's content.
    */
class _MyHomePageState extends State<MyHomePage> {
  //state variables
  late String documentsPath;
  late String tempPath;
  late File myFile;
  late String fileText;

  //adding the method for retrieving the
  //temporary and documents directories
  Future getPaths() async {
    final docDir = await getApplicationDocumentsDirectory();
    final tempDir = await getTemporaryDirectory();
    setState(() {
      //retrieving the absolute path of document directory
      documentsPath = docDir.path;
      //retrieving the absolute path of temporary directory
      tempPath = tempDir.path;
    });
  }

  Future<bool> writeFile() async {
    /*
        The writeAsString method is asychronous, but there is also 
        a synchronous version of it called writeAsStringSync(). 
        Unless you have a very good reason to do otherwise, 
        always prefer the asynchronous version of the method.
        */
    try {
      //This writes the String contained as a parameter into the file.
      await myFile.writeAsString('Margherita, Capricciosa, Napoli');
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> readFile() async {
    try {
      // Reading the file.
      String fileContent = await myFile.readAsString();
      setState(() {
        //assigning fileContent to fileText.
        fileText = fileContent;
      });
      return true;
    } catch (e) {
      // On error, return false.
      return false;
    }
  }

  @override
  void initState() {
    fileText = '';
    documentsPath = '';
    tempPath = '';
    getPaths().then((_) {
      myFile = File('$documentsPath/pizzas.txt'); //This creates a file object
      writeFile();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Path Provider',
          style: TextStyle(
            color: Colors.lightBlueAccent,
            fontStyle: FontStyle.italic,
            fontSize: 36,
            fontWeight: FontWeight.bold,
            fontFamily: 'italics',
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Document directory path:  $documentsPath'),
          Text('Temporary directory path:  $tempPath'),
          Center(
            child: ElevatedButton(
              child: const Text(
                'Read File',
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 28,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () => readFile(),
            ),
          ),
          Text(fileText),
        ],
      ),
    );
  }
}
