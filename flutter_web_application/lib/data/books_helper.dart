import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../favorite_screen.dart';
import 'book.dart';

class BooksHelper {
  final String urlKey = "AIzaSyCsn2P9lR7R-d_vrG2MfkPohWW3EMeK5ck";
  final String urlQuery = 'volumes?q=';
  final String urlBase = 'https://www.googleapis.com/books/v1/';
  Future<List<dynamic>?> getBooks(String query) async {
    final String url = urlKey + urlQuery + urlBase + query;
    Response result = await http.get(Uri.parse(url));
    if (result.statusCode == 200) {
      final jsonResponse = json.decode(result.body);
      final booksMap = jsonResponse['items'];
      List<dynamic> books = booksMap.map((i) => Book.fromJson(i)).toList();
      return books;
    } else {
      return null;
    }
  }

  Future addToFavorites(Book book) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? id = preferences.getString(book.id); //this adds to the store
    if (id != '') {
      /*
      shared preferences only take simple data,so we need to transform
      the object into a string,and we can achieve this 
      by calling the json.encode() method over the book,transformed
      in json format.
      */
      await preferences.setString(book.id, json.encode(book.toJson()));
    }
  }

  Future removeFromFavorites(Book book, BuildContext context) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? id = preferences.getString(book.id); //this method adds to store
    if (id != '') {
      /*
      The method to remove data from SharedPreferences is called
      remove(), and only takes the key of the value to be deleted.
      */
      await preferences.remove(book.id);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => FavoriteScreen(),
        ),
      );
    }
  }

  Future<List<dynamic>> getFavorites() async {
    // returns the favorite books or an empty list
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<dynamic> favBooks = <dynamic>[];
    /*
    Use the getKeys() method to retrieve all the keys 
    currently stored in the SharedPreferences.
    */
    Set allKeys = prefs.getKeys();
    /*
    If the set of keys is not empty,for each key,
    retrieve the value at the current position, 
    using the get() method of the instance of SharedPreference.
    This will be a string. So after converting it to a json,
    create a Book from the json,and add it to the list of books.
    */
    if (allKeys.isNotEmpty) {
      for (int i = 0; i < allKeys.length; i++) {
        String key = (allKeys.elementAt(i).toString());
        String value = prefs.get(key) as String;
        dynamic json = jsonDecode(value);
        Book book = Book(json['id'], json['title'], json['authors'],
            json['description'], json['publisher']);
        favBooks.add(book);
      }
    }
    return favBooks;
  }
}
