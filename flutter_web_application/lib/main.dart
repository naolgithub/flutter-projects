import 'package:flutter/material.dart';

import 'data/books_helper.dart';
import 'favorite_screen.dart';
import 'ui.dart';

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
      title: 'My books',
      theme: ThemeData(
        // light mode
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData.dark(), //dark mode
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
  // instance of BooksHelper class
  late BooksHelper helper;
  //list of books that will be shown on the screen
  List<dynamic> books = <dynamic>[];
  //number of books retrieved
  late int booksCount;
  //for search text field
  late TextEditingController txtSearchController;
  @override
  void initState() {
    helper = BooksHelper();
    txtSearchController = TextEditingController();
    initialize();
    super.initState();
  }

  Future initialize() async {
    books = (await helper.getBooks('Flutter'))!;
    setState(() {
      booksCount = books.length;
      books = books;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isSmall = false;
    if (MediaQuery.of(context).size.width < 600) isSmall = true;
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Books'),
        //InkWell() method is a rectangular area that respond to touch/or click
        actions: [
          InkWell(
            /*
            The child of the padding widget depend on the size of the screen.
            on smaller screens,the user will see the home icon from the Icons
            emulator. For larger screens,they will see a text with Home.
            */
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: (isSmall) ? const Icon(Icons.home) : const Text('Home'),
            ),
          ),
          InkWell(
            /*
            The child of the padding widget depend on the size of the screen.
            on smaller screens,the user will see the star icon from the Icons
            emulator. For larger screens,they will see a text with Favorites.
            */
            child: Padding(
              padding: const EdgeInsets.all(20),
              child:
                  (isSmall) ? const Icon(Icons.star) : const Text('Favorites'),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FavoriteScreen()));
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  const Text('Search book'),
                  Container(
                    padding: const EdgeInsets.all(20),
                    width: 200,
                    child: TextField(
                      controller: txtSearchController,
                      /*
                      For mobile devices that have a virtual keyboard,
                      the keyboardType will of type text.
                      And the textInputAction will of the type search.
                      */
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.search,
                      onSubmitted: (text) {
                        helper.getBooks(text).then((value) {
                          setState(() {
                            books = value!;
                          });
                        });
                      },
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () =>
                          helper.getBooks(txtSearchController.text),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: (isSmall)
                  ? BooksList(books, false)
                  : BooksTable(books, false),
            ),
          ],
        ),
      ),
    );
  }
}
