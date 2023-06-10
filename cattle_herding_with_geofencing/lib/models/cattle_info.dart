// ignore_for_file: public_member_api_docs, sort_constructors_first
class CattleInfo {
  final double temperature;
  final double heartBeatRate;
  final int cattleId;
  final String position;
  double get getTemperature => temperature;
  double get getHeartBeatRate => heartBeatRate;
  int get getCattleId => cattleId;
  String get getPosition => position;
  CattleInfo({
    required this.temperature,
    required this.heartBeatRate,
    required this.cattleId,
    required this.position,
  });

  // get getterMethod => toMap();
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'temperature': temperature,
      'heartBeatRate': heartBeatRate,
      'cattleId': cattleId,
      'position': position,
    };
  }

  factory CattleInfo.fromMap(Map<String, dynamic> map) {
    return CattleInfo(
      temperature: map['temperature'] as double,
      heartBeatRate: map['heartBeatRate'] as double,
      cattleId: map['cattleId'] as int,
      position: map['position'] as String,
    );
  }
}
