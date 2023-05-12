class Pizza {
  int id;
  String pizzaName;
  String description;
  double price;
  String imageUrl;
  Pizza({
    required this.id,
    required this.pizzaName,
    required this.description,
    required this.price,
    required this.imageUrl,
  });
  factory Pizza.fromJson(Map<String, dynamic> json) {
    return Pizza(
      id: json['id'] != null ? int.parse(json['id'].toString()) : 0,
      pizzaName: json['pizzaName'] != null ? json['pizzaName'].toString() : '',
      description:
          json['description'] != null ? json['description'].toString() : '',
      price: (json['price'] != null) ? json['price'] : 0.0,
      imageUrl: json['imageUrl'] != null ? json['imageUrl'].toString() : '',
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'pizzaName': pizzaName,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
    };
  }
}
