import 'package:bored_app_using_bored_api/models/activity.dart';
import 'package:bored_app_using_bored_api/services/api_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<Activity> futureActivity;

  @override
  void initState() {
    super.initState();
    futureActivity = ApiService.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Bored App'),
        ),
        body: Center(
          // child: MaterialButton(
          //   onPressed: () async => await ApiService.getData(),
          //   child: const Text('Get Data'),
          // ),
          child: FutureBuilder<Activity>(
              future: futureActivity,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data!.activity);
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                // By default, show a loading spinner.
                return const CircularProgressIndicator();
              }),
        ));
  }
}
