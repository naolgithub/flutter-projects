import 'package:castvotes/firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cast Votes',
      theme: ThemeData(
        textTheme: GoogleFonts.satisfyTextTheme(
          const TextTheme(
            bodyMedium: TextStyle(
              color: Colors.lightBlue,
              fontStyle: FontStyle.italic,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        appBarTheme: AppBarTheme(
          elevation: 2,
          centerTitle: true,
          titleTextStyle: GoogleFonts.satisfy(
            color: Colors.deepPurple,
            fontSize: 35,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
          ),
        ),
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
  //getting data from firestore database
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('users').snapshots();
  //adding/writing data to firestore database
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  String name = '';
  String hobby = '';
  String address = '';
  String bestFriend = '';
  Future<void> addUser() {
    // Call the user's CollectionReference to add a new user
    return users
        .add({
          'name': name, // John Doe
          'hobby': hobby,
          'address': address,
          'bestFriend': bestFriend,
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cloud Firestore Example'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.04,
            horizontal: MediaQuery.of(context).size.width * 0.04,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Basic information',
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                onChanged: (value) {
                  //Do something with the user input.
                  name = value;
                },
                decoration: const InputDecoration(
                  hintText: 'Enter your full name please',
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 20.0,
                    horizontal: 20.0,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(6.0),
                    ),
                  ),
                ),
              ),
              TextField(
                onChanged: (value) {
                  //Do something with the user input.
                  address = value;
                },
                decoration: const InputDecoration(
                  hintText: 'Enter your address please',
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 20.0,
                    horizontal: 20.0,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(6.0),
                    ),
                  ),
                ),
              ),
              TextField(
                onChanged: (value) {
                  //Do something with the user input.
                  hobby = value;
                },
                decoration: const InputDecoration(
                  hintText: 'Enter your hobby please',
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 20.0,
                    horizontal: 20.0,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(6.0),
                    ),
                  ),
                ),
              ),
              TextField(
                onChanged: (value) {
                  //Do something with the user input.
                  bestFriend = value;
                },
                decoration: const InputDecoration(
                  hintText: 'Enter your bestie please',
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 20.0,
                    horizontal: 20.0,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(6.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              ElevatedButton.icon(
                onPressed: () {
                  addUser();
                },
                icon: const Icon(Icons.add),
                label: const Text('Add User'),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text('Retrieving data from firestore'),
              const SizedBox(
                height: 10,
              ),
              StreamBuilder(
                stream: _usersStream,
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {
                  if (snapshot.hasError) {
                    return const Text('Something went wrong');
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Text("Loading");
                  }
                  return ListView(
                    shrinkWrap: true,
                    children:
                        snapshot.data!.docs.map((DocumentSnapshot document) {
                      Map<String, dynamic> data =
                          document.data()! as Map<String, dynamic>;
                      return ListTile(
                        title: Text(data['name']),
                        leading: Text(data['hobby']),
                        subtitle: Text(data['bestFriend']),
                        trailing: Text(data['address']),
                        dense: true,
                        iconColor: Colors.lightBlueAccent,
                        textColor: const Color.fromARGB(255, 29, 11, 127),
                      );
                    }).toList(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
