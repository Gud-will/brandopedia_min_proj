import 'package:sqlite3/sqlite3.dart';

void prepopulateFoodItems(Database db) {
  final List<Map<String, dynamic>> sampleItems = [
    {
      'name': 'Margherita Pizza',
      'isVeg': 1,
      'imageUrl':
          'https://images.unsplash.com/photo-1586190848861-99aa4a171e90',
      'price': 7.99,
      'restaurantName': 'Pizzeria Uno',
      'mealType': 'Main Course',
      'rating': 4.5,
      'description': 'Classic cheese pizza with tomato sauce and basil',
      'isFavorite': 0,
    },
    {
      'name': 'Butter Chicken',
      'isVeg': 0,
      'imageUrl':
          'https://images.unsplash.com/photo-1577805947697-89e18249d767',
      'price': 9.49,
      'restaurantName': 'Tandoori Flames',
      'mealType': 'Main Course',
      'rating': 4.7,
      'description': 'Creamy tomato-based chicken curry',
      'isFavorite': 0,
    },
    {
      'name': 'Veg Biryani',
      'isVeg': 1,
      'imageUrl':
          'https://images.unsplash.com/photo-1586190848861-99aa4a171e90',
      'price': 6.49,
      'restaurantName': 'Biryani House',
      'mealType': 'Main Course',
      'rating': 4.4,
      'description': 'Aromatic basmati rice with vegetables and spices',
      'isFavorite': 0,
    },
    {
      'name': 'Chocolate Milkshake',
      'isVeg': 1,
      'imageUrl':
          'https://images.unsplash.com/photo-1577805947697-89e18249d767',
      'price': 3.99,
      'restaurantName': 'Shake It Up',
      'mealType': 'Drink',
      'rating': 4.2,
      'description': 'Thick chocolate shake topped with whipped cream',
      'isFavorite': 0,
    },
    {
      'name': 'Grilled Chicken Sandwich',
      'isVeg': 0,
      'imageUrl':
          'https://images.unsplash.com/photo-1586190848861-99aa4a171e90',
      'price': 5.99,
      'restaurantName': 'Grill Spot',
      'mealType': 'Snack',
      'rating': 4.3,
      'description': 'Juicy grilled chicken with lettuce and sauce',
      'isFavorite': 0,
    },
    {
      'name': 'Gulab Jamun',
      'isVeg': 1,
      'imageUrl':
          'https://images.unsplash.com/photo-1577805947697-89e18249d767',
      'price': 2.49,
      'restaurantName': 'Sweet Delights',
      'mealType': 'Dessert',
      'rating': 4.8,
      'description': 'Soft fried balls soaked in sugar syrup',
      'isFavorite': 0,
    },
    {
      'name': 'Veg Momos',
      'isVeg': 1,
      'imageUrl':
          'https://images.unsplash.com/photo-1586190848861-99aa4a171e90',
      'price': 4.50,
      'restaurantName': 'Tibetan Tummy',
      'mealType': 'Snack',
      'rating': 4.1,
      'description': 'Steamed dumplings filled with vegetables',
      'isFavorite': 0,
    },
    {
      'name': 'Cold Coffee',
      'isVeg': 1,
      'imageUrl':
          'https://images.unsplash.com/photo-1577805947697-89e18249d767',
      'price': 3.50,
      'restaurantName': 'Bean Scene',
      'mealType': 'Drink',
      'rating': 4.0,
      'description': 'Iced coffee blend with a chocolate twist',
      'isFavorite': 0,
    },
    {
      'name': 'Paneer Tikka',
      'isVeg': 1,
      'imageUrl':
          'https://images.unsplash.com/photo-1586190848861-99aa4a171e90',
      'price': 6.99,
      'restaurantName': 'Punjabi Dhaba',
      'mealType': 'Starter',
      'rating': 4.6,
      'description': 'Marinated paneer cubes grilled to perfection',
      'isFavorite': 0,
    },
    {
      'name': 'Chicken Burger',
      'isVeg': 0,
      'imageUrl':
          'https://images.unsplash.com/photo-1577805947697-89e18249d767',
      'price': 5.25,
      'restaurantName': 'Burger Craze',
      'mealType': 'Snack',
      'rating': 4.5,
      'description': 'Crispy chicken patty with spicy mayo',
      'isFavorite': 0,
    },
  ];

  for (var item in sampleItems) {
    db.execute(
      'INSERT INTO food_items (name, isVeg, imageUrl, price, restaurantName, mealType, rating, description, isFavorite) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);',
      [
        item['name'],
        item['isVeg'],
        item['imageUrl'],
        item['price'],
        item['restaurantName'],
        item['mealType'],
        item['rating'],
        item['description'],
        item['isFavorite'],
      ],
    );
  }
}
