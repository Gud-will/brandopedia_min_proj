import 'package:sqlite3/sqlite3.dart';
import 'dart:io';
import '../models/cart_item.dart';
import '../models/food_item.dart';

class DatabaseHelper {
  late final Database db;

  DatabaseHelper() {
    final dbPath = '${Directory.current.path}/food_app.db';
    db = sqlite3.open(dbPath);
    _createTables();
  }

  void _createTables() {
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
    print("Created table food_items");
    db.execute('''
      CREATE TABLE IF NOT EXISTS cart_items (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        foodName TEXT,
        price REAL,
        quantity INTEGER,
        imageUrl TEXT,
        foodRestaurent TEXT
      );
    ''');
    print("Created table cart_items");
  }

  // 🥘 Insert FoodItem
  void insertFoodItem(FoodItem item) {
    db.execute(
      'INSERT INTO food_items (name, isVeg, imageUrl, price, restaurantName, mealType, rating, description, isFavorite) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);',
      [
        item.name,
        item.isVeg ? 1 : 0,
        item.imageUrl,
        item.price,
        item.restaurantName,
        item.mealType,
        item.rating,
        item.description,
        item.isFavorite ? 1 : 0,
      ],
    );
  }

  List<FoodItem> getAllFoodItems() {
    final result = db.select('SELECT * FROM food_items');
    return result.map((row) => FoodItem.fromJson(row)).toList();
  }

  // 🛒 Cart Methods
  void insertCartItem(CartItem item) {
    db.execute(
      'INSERT INTO cart_items (foodName, price, quantity,imageUrl,foodRestaurent) VALUES (?, ?, ?, ?, ?);',
      [
        item.foodName,
        item.price,
        item.quantity,
        item.imageUrl,
        item.foodRestaurent,
      ],
    );
  }

  List<CartItem> getCartItems() {
    final result = db.select('SELECT * FROM cart_items');
    return result.map((row) => CartItem.fromJson(row)).toList();
  }

  void updateCartItem(CartItem item) {
    db.execute(
      'UPDATE cart_items SET foodName = ?, price = ?, quantity = ?, imageUrl = ?, foodRestaurent=? WHERE id = ?;',
      [
        item.foodName,
        item.price,
        item.quantity,
        item.imageUrl,
        item.foodRestaurent,
        item.id,
      ],
    );
  }

  void deleteCartItem(int id) {
    db.execute('DELETE FROM cart_items WHERE id = ?;', [id]);
  }

  void clearCart() {
    db.execute('DELETE FROM cart_items;');
  }

  void close() {
    db.dispose();
  }
}
