import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';

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
      title: 'Accessing the file system',
      theme: ThemeData(
        textTheme: GoogleFonts.satisfyTextTheme(
          const TextTheme(
            bodyMedium: TextStyle(
              color: Colors.lightBlueAccent,
              fontFamily: 'italics',
              fontStyle: FontStyle.italic,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
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
    There are two directories you can get with path_provider: 
    the documents directory and the temporary directory.

    Since the temporary directory can be cleared by 
    the system at any time, you should use the 
    documents directory whenever you need to store data 
    that you need to save, and use the temporary directory as a 
    sort of cache or session storage for your app.

    The two methods that retrieve the directories when you use 
    the path_provider library are GetApplicationDocumentsDirectory 
    and getTemporaryDirectory.

    Both are asynchronous and return a Directory object.
    */
class _MyHomePageState extends State<MyHomePage> {
  //state variables
  late String documentsPath;
  late String tempPath;

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

  @override
  void initState() {
    documentsPath = '';
    tempPath = '';
    getPaths();
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
            fontSize: 35,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'Document directory path: $documentsPath',
          ),
          Text(
            'Temporary directory path: $tempPath',
          ),
        ],
      ),
    );
  }
}
