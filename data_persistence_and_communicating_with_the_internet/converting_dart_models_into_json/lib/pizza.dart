class Pizza {
  int id;
  String pizzaName;
  String description;
  double price;
  String imageUrl;
  /*
      Using constants instead of hard typing to 
      prevent errors that are difficult to debug.
      */
  static const keyId = 'id';
  static const keyName = 'pizzaName';
  static const keyDescription = 'description';
  static const keyPizzaName = 'pizzaName';
  static const keyPrice = 'price';
  static const keyImage = 'imageUrl';

  Pizza({
    required this.id,
    required this.pizzaName,
    required this.description,
    required this.price,
    required this.imageUrl,
  });
  factory Pizza.fromJson(Map<String, dynamic> json) {
    return Pizza(
      id: json[keyId],
      pizzaName: json[keyPizzaName],
      description: json[keyDescription],
      price: json[keyPrice],
      imageUrl: json[keyImage],
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
