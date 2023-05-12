import 'dart:convert';

import 'package:converting_dart_models_into_json/pizza.dart';
import 'package:flutter/material.dart';
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
      title: 'Storing data using assets',
      theme: ThemeData(
        textTheme: GoogleFonts.satisfyTextTheme(
          const TextTheme(
            bodyMedium: TextStyle(
              color: Colors.lightBlueAccent,
              fontStyle: FontStyle.italic,
              fontSize: 28,
              fontFamily: 'italics',
              fontWeight: FontWeight.bold,
            ),
            titleMedium: TextStyle(
              color: Colors.lightBlueAccent,
              fontStyle: FontStyle.italic,
              fontSize: 28,
              fontFamily: 'italics',
              fontWeight: FontWeight.bold,
            ),
            labelMedium: TextStyle(
              color: Colors.lightBlueAccent,
              fontStyle: FontStyle.italic,
              fontSize: 28,
              fontFamily: 'italics',
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

class _MyHomePageState extends State<MyHomePage> {
  String pizzaString = '';

  @override
  void initState() {
    readJsonFile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'JSON',
          style: TextStyle(
            fontStyle: FontStyle.italic,
            color: Colors.lightBlueAccent,
          ),
        ),
      ),
      body: Center(
        child: FutureBuilder(
          future: readJsonFile(),
          builder: (BuildContext context, AsyncSnapshot<List<Pizza>> pizzas) {
            return ListView.builder(
              itemCount: pizzas.data == null ? 0 : pizzas.data!.length,
              itemBuilder: (BuildContext context, int position) {
                return ListTile(
                  title: Text(
                    pizzas.data![position].pizzaName,
                    style: const TextStyle(
                      color: Colors.lightBlueAccent,
                      fontSize: 40,
                    ),
                  ),
                  subtitle: Text(
                    '${pizzas.data![position].description} - € ${pizzas.data![position].price.toString()}',
                    style: const TextStyle(
                      color: Colors.lightBlueAccent,
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  Future<List<Pizza>> readJsonFile() async {
    //1.Reading the JSON file
    String myString = await DefaultAssetBundle.of(context)
        .loadString('assets/pizzalist.json');
    //2.Transforming the JSON string into a list of Map objects
    List myMap = jsonDecode(myString);

    List<Pizza> myPizzas = [];
    for (var pizza in myMap) {
      //3.Transforming the Map objects into Pizza objects
      Pizza myPizza = Pizza.fromJson(pizza);
      //4.Adding the transformed map (now,object) to myPizzas list
      myPizzas.add(myPizza);
    }

    String json = convertToJSON(myPizzas);
    print(json);

    return myPizzas;
  }

  /*
      This method transforms our List of Pizza 
      objects back into a Json string by calling the 
      jsonEncode method again in the dart_convert library.
      */
  String convertToJSON(List<Pizza> pizzas) {
    String json = '[';
    for (var pizza in pizzas) {
      json += jsonEncode(pizza);
    }
    json += ']';
    return json;
  }
}
