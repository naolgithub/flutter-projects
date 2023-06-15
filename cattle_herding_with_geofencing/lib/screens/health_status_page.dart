import 'dart:async';
import 'dart:math';

import 'package:cattle_herding_with_geofencing/widgets/everything_cool.dart';
import 'package:cattle_herding_with_geofencing/widgets/position.dart';
import 'package:cattle_herding_with_geofencing/widgets/temp_position.dart';
import 'package:cattle_herding_with_geofencing/widgets/temperature.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class HealthStatusPage extends StatefulWidget {
  final String latitudeController;
  final String lontitudeController;
  final String radiusController;
  const HealthStatusPage({
    required this.radiusController,
    required this.lontitudeController,
    required this.latitudeController,
    super.key,
  });

  @override
  State<HealthStatusPage> createState() => _HealthStatusPageState();
}

class _HealthStatusPageState extends State<HealthStatusPage> {
  /*
    d = 2r * arcsin(sqrt(sin²((lat₂ - lat₁) / 2) + cos(lat₁) * cos(lat₂) * sin²((lon₂ - lon₁) / 2)))
    */

  // final _firebaseRef = FirebaseDatabase.instance.ref().child('chats');
  final _firebaseRef = FirebaseDatabase.instance.ref('/');
  late final double temperature;
  late final double heartBeat;
  late final double position;
  // late dynamic data;

  @override
  void dispose() {
    super.dispose();
  }

  double _fontSize = 16.0;
  Color _color = Colors.cyan;
  @override
  void initState() {
    super.initState();
    // getCattleData();
    Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (mounted) {
        setState(() {
          _fontSize = _fontSize == 16.0 ? 24.0 : 16.0;
          _color = _color == Colors.cyan ? Colors.red : Colors.cyan;
        });
      }
    });

    // getCattleData() async {
    //   StreamBuilder(
    //       stream: _firebaseRef.onValue,
    //       builder: (BuildContext context, AsyncSnapshot snapshot) {
    //         if (snapshot.connectionState == ConnectionState.active) {
    //           if (snapshot.hasData &&
    //               !snapshot.hasError &&
    //               snapshot.data.snapshot.value != null) {
    //             // return Text(snapshot.data.snapshot.value);
    //             CattleInfo.fromMap(snapshot.data.snapshot.value);
    //           }
    //           if (snapshot.hasError) {
    //             return Center(
    //               child: Text('$snapshot.error'),
    //             );
    //           }
    //         }
    //         if (snapshot.connectionState == ConnectionState.waiting) {
    //           return const Center(
    //             child: CircularProgressIndicator(
    //               color: Colors.white,
    //             ),
    //           );
    //         }
    //         return const Text('data');
    //       });
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: StreamBuilder(
          stream: _firebaseRef.onValue,
          builder: (context, snap) {
            if (snap.hasData &&
                !snap.hasError &&
                snap.data!.snapshot.value != null) {
              final data = snap.data!.snapshot.value as Map<String, dynamic>;
              // return Text(data['position']);
              // return Column(
              //   children: [
              //     Text('Temperature is: ${data['temp']}'),
              //     Text('Latitude is: ${data['lat']}'),
              //     Text('Longtitude is: ${data['lgtd']}'),
              //   ],
              // );

              /*
    float  earth_radius = 6371;
    float lat1 = HOME_LAT * M_PI / 180;
    float lat2 = LAT * M_PI / 180;
    float lon1 = HOME_LNG * M_PI / 180;
    float lon2 = LNG * M_PI / 180;
    float  dlat = lat2 - lat1;
    float  dlon = lon2 - lon1;
    float  a = pow(sin(dlat / 2), 2) + cos(lat1) * cos(lat2) * pow(sin(dlon / 2), 2);
    float  c = 2 * asin(sqrt(a));

    float distance = (earth_radius * c)*1000;
         */
              // Calculating distance b/n two points
              double earthRadius = 6371;
              double lat1 =
                  double.parse(widget.latitudeController) * (pi / 12) / 180;
              double lat2 = double.parse(data['lat']) * (pi / 12) / 180;
              double dlat = lat2 - lat1;
              double long1 =
                  double.parse(widget.lontitudeController) * (pi / 12) / 180;
              double long2 = double.parse(data['lgtd']) * (pi / 12) / 180;
              double dlon = long2 - long1;
              double a = pow(sin(dlat / 2), 2) +
                  cos(lat1) * cos(lat2) * pow(sin(dlon / 2), 2);
              double c = 2 * asin(sqrt(a));
              double distance = (earthRadius * c) * 1000;

              // //calculating radius of home grazing area
              double homeLatitude = double.parse(widget.latitudeController);
              double homeLongtitude = double.parse(widget.lontitudeController);
              double homeRadius = double.parse(widget.radiusController);
              // double homeDistance=2r * arcsin(sqrt(sin²((lat₂ - lat₁) / 2) + cos(lat₁) * cos(lat₂) * sin²((lon₂ - lon₁) / 2)))
              /*
           d = 2r * arcsin(sqrt(sin²((lat₂ - lat₁) / 2) + cos(lat₁) * cos(lat₂) * sin²((lon₂ - lon₁) / 2)))
           */

              if (distance > homeRadius &&
                  (double.parse(data['temp']) < 0 ||
                      double.parse(data['temp']) > 100)) {
                return const TempPosition();
              } else if (double.parse(data['temp']) < 0 ||
                  double.parse(data['temp']) > 100) {
                return const Temperature();
              } else if (distance > homeRadius) {
                return const Position();
              } else {
                return const EverythingIsCool();
              }
            }
            return const Text("No data");
            // return const Temperature();
          },
        ),
      ),
    );
  }
}
