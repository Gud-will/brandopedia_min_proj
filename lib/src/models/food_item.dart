class FoodItem {
  final int? id;
  final String name;
  final bool isVeg;
  final String imageUrl;
  final double price;
  final String restaurantName;
  final String mealType;
  final double rating;
  final String description;
  final bool isFavorite;

  FoodItem({
    this.id,
    required this.name,
    required this.isVeg,
    required this.imageUrl,
    required this.price,
    required this.restaurantName,
    required this.mealType,
    required this.rating,
    required this.description,
    this.isFavorite = false,
  });

  // Convert class to JSON (e.g. for APIs or debugging)
  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'isVeg': isVeg ? 1 : 0,
    'imageUrl': imageUrl,
    'price': price,
    'restaurantName': restaurantName,
    'mealType': mealType,
    'rating': rating,
    'description': description,
    'isFavorite': isFavorite ? 1 : 0,
  };

  // Create class from JSON/map
  factory FoodItem.fromJson(Map<String, dynamic> json) => FoodItem(
    id: json['id'],
    name: json['name'],
    isVeg: json['isVeg'] == 1,
    imageUrl: json['imageUrl'],
    price: json['price'].toDouble(),
    restaurantName: json['restaurantName'],
    mealType: json['mealType'],
    rating: json['rating'].toDouble(),
    description: json['description'],
    isFavorite: json['isFavorite'] == 1,
  );

  // Optional: copyWith for updating values immutably
  FoodItem copyWith({
    int? id,
    String? name,
    bool? isVeg,
    String? imageUrl,
    double? price,
    String? restaurantName,
    String? mealType,
    double? rating,
    String? description,
    bool? isFavorite,
  }) {
    return FoodItem(
      id: id ?? this.id,
      name: name ?? this.name,
      isVeg: isVeg ?? this.isVeg,
      imageUrl: imageUrl ?? this.imageUrl,
      price: price ?? this.price,
      restaurantName: restaurantName ?? this.restaurantName,
      mealType: mealType ?? this.mealType,
      rating: rating ?? this.rating,
      description: description ?? this.description,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
