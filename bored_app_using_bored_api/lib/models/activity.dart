// ignore_for_file: public_member_api_docs, sort_constructors_first
class Activity {
  final String activity;
  final String type;
  final int participants;
  final double price;
  final String link;
  final String key;
  final double accessibility;
  Activity({
    required this.activity,
    required this.type,
    required this.participants,
    required this.price,
    required this.link,
    required this.key,
    required this.accessibility,
  });

  // Activity copyWith({
  //   String? activity,
  //   String? type,
  //   int? participants,
  //   double? price,
  //   String? link,
  //   String? key,
  //   String? accessibility,
  // }) {
  //   return Activity(
  //     activity: activity ?? this.activity,
  //     type: type ?? this.type,
  //     participants: participants ?? this.participants,
  //     price: price ?? this.price,
  //     link: link ?? this.link,
  //     key: key ?? this.key,
  //     accessibility: accessibility ?? this.accessibility,
  //   );
  // }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'activity': activity,
      'type': type,
      'participants': participants,
      'price': price,
      'link': link,
      'key': key,
      'accessibility': accessibility,
    };
  }

  factory Activity.fromJson(Map<String, dynamic> json) {
    return Activity(
      activity: json['activity'],
      type: json['type'],
      participants: json['participants'],
      price: json['price'],
      link: json['link'],
      key: json['key'],
      accessibility: json['accessibility'],
    );
  }

  // String toJson() => json.encode(toMap());

  // factory Activity.fromJson(String source) =>
  //     Activity.fromMap(json.decode(source) as Map<String, dynamic>);

  // @override
  // String toString() {
  //   return 'Activity(activity: $activity, type: $type, participants: $participants, price: $price, link: $link, key: $key, accessibility: $accessibility)';
  // }

  // @override
  // bool operator ==(covariant Activity other) {
  //   if (identical(this, other)) return true;

  //   return other.activity == activity &&
  //       other.type == type &&
  //       other.participants == participants &&
  //       other.price == price &&
  //       other.link == link &&
  //       other.key == key &&
  //       other.accessibility == accessibility;
  // }

  // @override
  // int get hashCode {
  //   return activity.hashCode ^
  //       type.hashCode ^
  //       participants.hashCode ^
  //       price.hashCode ^
  //       link.hashCode ^
  //       key.hashCode ^
  //       accessibility.hashCode;
  // }
}
