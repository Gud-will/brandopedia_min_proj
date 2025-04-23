import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/food_item.dart';
import 'db_notifier.dart';

final foodItemsProvider = FutureProvider<List<FoodItem>>((ref) async {
  final db = await ref.watch(databaseProvider.future);
  final result = db.select('SELECT * FROM food_items');
  return result.map((row) => FoodItem.fromJson(row)).toList();
});
