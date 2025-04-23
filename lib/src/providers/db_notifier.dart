import 'package:brandopedia_min_proj/src/resources/dummy_items_helper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' show FutureProvider;
import 'package:sqlite3/sqlite3.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

final databaseProvider = FutureProvider<Database>((ref) async {
  final docDir = await getApplicationDocumentsDirectory();
  final dbPath = p.join(docDir.path, 'food_app.db');
  final db = sqlite3.open(dbPath);

  // Create table if it doesn't exist
  db.execute('''
    CREATE TABLE IF NOT EXISTS food_items (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT,
      isVeg INTEGER,
      imageUrl TEXT,
      price REAL,
      restaurantName TEXT,
      mealType TEXT,
      rating REAL,
      description TEXT,
      isFavorite INTEGER
    );
  ''');

  // Optional: Pre-populate only if empty
  final result = db.select('SELECT COUNT(*) as count FROM food_items');
  if (result.first['count'] == 0) {
    prepopulateFoodItems(db);
    // final stmt = db.prepare('''
    //   INSERT INTO food_items
    //   (name, isVeg, imageUrl, price, restaurantName, mealType, rating, description, isFavorite)
    //   VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)
    // ''');

    // final items = [
    //   {
    //     'name': 'Veg Burger',
    //     'isVeg': 1,
    //     'imageUrl': 'https://picsum.photos/seed/burger/200/200',
    //     'price': 129.0,
    //     'restaurantName': 'Burger Barn',
    //     'mealType': 'Main',
    //     'rating': 4.2,
    //     'description': 'Crispy veg patty with sauce',
    //     'isFavorite': 0,
    //   },
    //   {
    //     'name': 'Lemonade',
    //     'isVeg': 1,
    //     'imageUrl': 'https://picsum.photos/seed/lemonade/200/200',
    //     'price': 49.0,
    //     'restaurantName': 'Cool Drinks',
    //     'mealType': 'Drink',
    //     'rating': 4.8,
    //     'description': 'Refreshing lemon drink',
    //     'isFavorite': 1,
    //   },
    // ];

    // for (var item in items) {
    //   stmt.execute([
    //     item['name'],
    //     item['isVeg'],
    //     item['imageUrl'],
    //     item['price'],
    //     item['restaurantName'],
    //     item['mealType'],
    //     item['rating'],
    //     item['description'],
    //     item['isFavorite'],
    //   ]);
    // }

    // stmt.dispose();
  }

  return db;
});
