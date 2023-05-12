import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'todo_list.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  /// firebase
  final _fireStore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  late User? loggedInUser;

  /// form variable
  late String day;
  late String task;
  late String time;
  late String place;
  late TextEditingController dayTextController;
  late TextEditingController placeTextController;
  late TextEditingController taskTextController;
  late TextEditingController timeTextController;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
    loggedInUser = null;
    dayTextController = TextEditingController();
    placeTextController = TextEditingController();
    taskTextController = TextEditingController();
    timeTextController = TextEditingController();
  }

  void getCurrentUser() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser?.email);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void dispose() {
    dayTextController.dispose();
    placeTextController.dispose();
    taskTextController.dispose();
    timeTextController.dispose();
    super.dispose();
  }

  void logout() {
    _auth.signOut();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('ADD TODO LIST'),
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              // _auth.signOut();
              // Navigator.pop(context);
              logout();
              //   getMessages();
              //Implement logout functionality
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Add Activity',
                textAlign: TextAlign.center,
                // style: TextStyle(
                //   fontSize: 40,
                //   color: Colors.blue,
                // ),
              ),
            ),
            TextField(
              controller: dayTextController,
              onChanged: (value) {
                day = value;
              },
              decoration: const InputDecoration(
                hintText: 'Day',
                alignLabelWithHint: true,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            TextField(
              controller: placeTextController,
              onChanged: (value) {
                place = value;
              },
              decoration: const InputDecoration(
                hintText: 'Place',
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            TextField(
              controller: taskTextController,
              onChanged: (value) {
                task = value;
              },
              decoration: const InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                hintText: 'Task',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            TextField(
              controller: timeTextController,
              onChanged: (value) {
                time = value;
              },
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(10),
                hintText: 'Time',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                // elevation: 5.0,
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.circular(30.0),
                child: MaterialButton(
                  minWidth: 200.0,
                  height: 42.0,
                  child: const Text(
                    'Save',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    _fireStore.collection('todo').add({
                      'day': day,
                      'task': task,
                      'place': place,
                      'time': time,
                      'sender': loggedInUser?.email,
                      'created': Timestamp.now(),
                    });
                    dayTextController.clear();
                    placeTextController.clear();
                    taskTextController.clear();
                    timeTextController.clear();
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                elevation: 5.0,
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.circular(30.0),
                child: MaterialButton(
                  minWidth: 200.0,
                  height: 42.0,
                  child: const Text(
                    'Todo_List',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TodoList(),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
