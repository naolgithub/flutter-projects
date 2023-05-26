import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var urlData;
  void getApiData() async {
    var url = Uri.parse(
      'https://api.unsplash.com/photos/?client_id=vupfa77DTvgkVteN78rKCkFhnbxk0tHnZfezvBnZGnk',
    );
    final res = await http.get(url);
    setState(() {
      urlData = jsonDecode(res.body);
      // print(urlData);
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
        title: const Text('Wallpaper App'),
      ),
      body: Center(
        child: urlData == null
            ? const CircularProgressIndicator()
            : GridView.builder(
                itemCount: 10,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 6,
                  crossAxisCount: 2,
                  crossAxisSpacing: 2,
                ),
                itemBuilder: (context, i) {
                  return Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(urlData[i]['urls']['full']),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                }),
      ),
    );
  }
}
