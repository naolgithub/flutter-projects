import 'package:flutter/material.dart';

import 'package:flutter_web_application/data/books_helper.dart';

import 'main.dart';
import 'ui.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  late BooksHelper helper;
  List<dynamic> books = <dynamic>[];
  late int booksCount;
  Future initialize() async {
    books = await helper.getFavorites();
    setState(() {
      booksCount = books.length;
      books = books;
    });
  }

  @override
  void initState() {
    helper = BooksHelper();
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isSmall = false;
    if (MediaQuery.of(context).size.width < 600) {
      isSmall = true;
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Books'),
        actions: <Widget>[
          InkWell(
            child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: (isSmall) ? const Icon(Icons.home) : const Text('Home')),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MyHomePage()));
            },
          ),
          InkWell(
            child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: (isSmall)
                    ? const Icon(Icons.star)
                    : const Text('Favorites')),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          const Padding(
              padding: EdgeInsets.all(20), child: Text('My Favourite Books')),
          Padding(
              padding: const EdgeInsets.all(20),
              child:
                  (isSmall) ? BooksList(books, true) : BooksTable(books, true)),
        ],
      ),
    );
  }
}
