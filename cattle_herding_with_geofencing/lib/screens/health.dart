// import 'dart:async';

// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/material.dart';

// class HealthStatusPage extends StatefulWidget {
//   const HealthStatusPage({super.key});

//   @override
//   State<HealthStatusPage> createState() => _HealthStatusPageState();
// }

// class _HealthStatusPageState extends State<HealthStatusPage> {
//   // final _firebaseRef = FirebaseDatabase.instance.ref().child('chats');
//   final _firebaseRef =
//       FirebaseDatabase.instance.ref().child('parents').child('chats');
//   final TextEditingController _txtCtrl = TextEditingController();
//   late final double temperature;
//   late final double heartBeat;
//   late final double position;
//   // late dynamic data;

//   @override
//   void dispose() {
//     super.dispose();
//     _txtCtrl.dispose();
//   }

//   double _fontSize = 16.0;
//   Color _color = Colors.cyan;
//   @override
//   void initState() {
//     super.initState();
//     // getCattleData();
//     Timer.periodic(const Duration(seconds: 1), (Timer timer) {
//       if (mounted) {
//         setState(() {
//           _fontSize = _fontSize == 16.0 ? 24.0 : 16.0;
//           _color = _color == Colors.cyan ? Colors.red : Colors.cyan;
//         });
//       }
//     });

//     getCattleData() async {
//       StreamBuilder(
//           stream: _firebaseRef.onValue,
//           builder: (BuildContext context, AsyncSnapshot snapshot) {
//             if (snapshot.connectionState == ConnectionState.active) {
//               if (snapshot.hasData &&
//                   !snapshot.hasError &&
//                   snapshot.data.snapshot.value != null) {
//                 // return Text(snapshot.data.snapshot.value);
//                 // CattleInfo.fromMap(snapshot.data.snapshot.value);
//               }
//               if (snapshot.hasError) {
//                 return Center(
//                   child: Text('$snapshot.error'),
//                 );
//               }
//             }
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return const Center(
//                 child: CircularProgressIndicator(
//                   color: Colors.white,
//                 ),
//               );
//             }
//             return const Text('data');
//           });
//     }
//   }

//   sendMessage() async {
//     // _firebaseRef.onValue.listen((DatabaseEvent event) {
//     //   final data = event.snapshot.value;
//     //   debugPrint(data as String?);
//     // });

//     await _firebaseRef.set({
//       // "message": _txtCtrl.text,
//       'temperature': '23.5',
//       'heartBeatRate': '76.3',
//       'cattleId': '12345',
//       // 'position': 'center position',
//       // 'position': {
//       //   'longitude': '23.34',
//       //   'latitude': '232.453',
//       // },
//       'cattleName': 'dallaatti',
//       // "timestamp": DateTime.now().millisecondsSinceEpoch
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           centerTitle: true,
//           title: MaterialButton(
//             onPressed: () {
//               sendMessage();
//             },
//             child: const Text('SendMessage'),
//           ),
//         ),
//         body: Center(
//             child: StreamBuilder(
//           stream: _firebaseRef.onValue,
//           builder: (context, snap) {
//             if (snap.hasData &&
//                 !snap.hasError &&
//                 snap.data!.snapshot.value != null) {
//               final data = snap.data!.snapshot.value as Map<String, dynamic>;
//               return Text(data['position']);
//               // return Column(
//               //   children: [
//               //     // Text(data['temperature']),
//               //        Text(data['heartBeatRate']),
//               //     // Text(data['position']['latitude']),
//               //     // Text(data['cattleId']),
//               //     // Text(data['cattleName']),
//               //   ],
//               // );
//             } else {
//               return const Text("No data");
//             }
//           },
//         )));
//   }
// }
