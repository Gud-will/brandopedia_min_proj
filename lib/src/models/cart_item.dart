class CartItem {
  final int? id;
  final String foodName;
  final String foodRestaurent;
  final String imageUrl;
  final double price;
  late int quantity;

  CartItem({
    this.id,
    required this.imageUrl,
    required this.foodName,
    required this.foodRestaurent,
    required this.price,
    required this.quantity,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'foodName': foodName,
    'price': price,
    'quantity': quantity,
    'imageUrl': imageUrl,
    'foodRestaurent': foodRestaurent,
  };

  factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
    id: json['id'],
    foodName: json['foodName'],
    price: json['price'].toDouble(),
    quantity: json['quantity'],
    imageUrl: json['imageUrl'],
    foodRestaurent: json['foodRestaurent'],
  );

  CartItem copyWith({
    int? id,
    String? foodName,
    double? price,
    int? quantity,
    String? imageUrl,
    String? foodRestaurent,
  }) {
    return CartItem(
      id: id ?? this.id,
      foodName: foodName ?? this.foodName,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      imageUrl: imageUrl ?? this.imageUrl,
      foodRestaurent: foodRestaurent ?? this.foodRestaurent,
    );
  }
}
