import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var urlDataOne;
  var urlDataTwo;
  void getApiData() async {
    //first api
    var firstUrl = Uri.parse(
      'https://api.unsplash.com/photos/?client_id=vupfa77DTvgkVteN78rKCkFhnbxk0tHnZfezvBnZGnk',
    );
    //second api
    var secondUrl = Uri.parse(
      'https://api.unsplash.com/photos/?per_page=30&client_id=vupfa77DTvgkVteN78rKCkFhnbxk0tHnZfezvBnZGnk',
    );
    final resultOne = await http.get(firstUrl);
    final resultTwo = await http.get(secondUrl);
    setState(() {
      urlDataOne = jsonDecode(resultOne.body);
      // print(urlDataOne);
      urlDataTwo = jsonDecode(resultTwo.body);
      // print(urlDataTwo);
    });
  }

  @override
  void initState() {
    super.initState();
    getApiData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Wallpaper App',
          style: TextStyle(
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
      body: Center(
        child: urlDataTwo == null
            ? const CircularProgressIndicator()
            : GridView.builder(
                itemCount: 30,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 6,
                  crossAxisCount: 2,
                  crossAxisSpacing: 2,
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FullImageView(
                            url: urlDataTwo[index]['urls']['full'],
                          ),
                        ),
                      );
                    },
                    /*
                    In Flutter, a Hero widget is a widget that is used
                    for creating a transition animation between two screens.
                    It is typically used to create a smooth and visually
                    appealing transition when a user navigates from one
                    screen to another.
                    */
                    child: Hero(
                      tag: 'full',
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image:
                                NetworkImage(urlDataTwo[index]['urls']['full']),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
      ),
    );
  }
}

// ignore: must_be_immutable
class FullImageView extends StatelessWidget {
  var url;
  FullImageView({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'full',
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(url),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
