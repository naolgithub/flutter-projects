import 'package:cattle_herding_with_geofencing/screens/abera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

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
      title: 'Cattle Herding With Geofencing',
      theme: ThemeData(
        // textTheme: GoogleFonts.satisfyTextTheme(
        //   const TextTheme(
        //     displayMedium: TextStyle(
        //       fontSize: 50,
        //       fontStyle: FontStyle.italic,
        //       fontWeight: FontWeight.bold,
        //     ),
        //   ),
        // ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Abera(),
    );
  }
}

// class NaolKenbonFirebaseData extends StatefulWidget {
//   const NaolKenbonFirebaseData({super.key});

//   @override
//   State<NaolKenbonFirebaseData> createState() => _NaolKenbonFirebaseDataState();
// }

// class _NaolKenbonFirebaseDataState extends State<NaolKenbonFirebaseData> {
//   final databaseReference = FirebaseDatabase.instance.ref('/');
//   void readdData() async {
//     databaseReference.onChildAdded.listen((DatabaseEvent event) {
//       final data = event.snapshot.value;
//       print(data);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: StreamBuilder(
//           stream: databaseReference.onValue,
//           builder: (context, snap) {
//             if (snap.hasData &&
//                 !snap.hasError &&
//                 snap.data!.snapshot.value != null) {
//               final data = snap.data!.snapshot.value as Map<String, dynamic>;
//               // return Text(data['position']);
//               return Column(
//                 children: [
//                   // Text(data['temperature']),
//                   Text(data['lat']),
//                   Text(data['lgtd']),
//                   Text(data['temp']),
//                   // Text(data['position']['latitude']),
//                   // Text(data['cattleId']),
//                   // Text(data['cattleName']),
//                   // Temperature(),
//                 ],
//               );
//               // return const TempPosition();
//               // if (int.parse(data['temperature']) < 10 &&
//               //     int.parse(data['temperature']) > 20 &&
//               //     int.parse(data['heartBeatRate']) < 10 &&
//               //     int.parse(data['heartBeatRate']) > 20 &&
//               //     int.parse(data['position']) < 10 &&
//               //     int.parse(data['position']) > 20) {
//               //   return const TempPositionHeartBeatRate();
//               // } else if (int.parse(data['temperature']) < 10 &&
//               //     int.parse(data['temperature']) > 20 &&
//               //     int.parse(data['heartBeatRate']) < 10 &&
//               //     int.parse(data['heartBeatRate']) > 20) {
//               //   return const TempHeartBeatRate();
//               // } else if (int.parse(data['temperature']) < 10 &&
//               //     int.parse(data['temperature']) > 20 &&
//               //     int.parse(data['position']) < 10 &&
//               //     int.parse(data['position']) > 20) {
//               //   return const TempPosition();
//               // } else if (int.parse(data['heartBeatRate']) < 10 &&
//               //     int.parse(data['heartBeatRate']) > 20 &&
//               //     int.parse(data['position']) < 10 &&
//               //     int.parse(data['position']) > 20) {
//               //   return const PositionHeartBeatRate();
//               // }
//               // List item = [];

//               // data.forEach((index, data) => item.add({"key": index, ...data}));

//               // return ListView.builder(
//               //   itemCount: item.length,
//               //   itemBuilder: (context, index) {
//               //     return ListTile(
//               //       title: Text(item[index]['temperature']),
//               //     );
//               //   },
//               // );
//             } else {
//               return const Text("No data");
//             }
//           },
//         ),
//       ),
//     );
//   }
// }
