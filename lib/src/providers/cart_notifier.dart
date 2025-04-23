import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/cart_item.dart';

class CartNotifier extends StateNotifier<List<CartItem>> {
  CartNotifier() : super([]);

  void addToCart(CartItem item) {
    final index = state.indexWhere((e) => e.foodName == item.foodName);
    if (index != -1) {
      // already in cart → update quantity
      final updated = [...state];
      updated[index].quantity += item.quantity;
      state = updated;
    } else {
      state = [...state, item];
    }
  }

  void updateQuantity(String foodName, int newQty) {
    if (newQty == 0) {
      removeItem(foodName);
      return;
    }
    final updated =
        state.map((e) {
          if (e.foodName == foodName) {
            return e.copyWith(quantity: newQty);
          }
          return e;
        }).toList();
    state = updated;
  }

  void removeItem(String foodName) {
    state = state.where((e) => e.foodName != foodName).toList();
  }

  double get totalPrice =>
      state.fold(0, (sum, item) => sum + (item.price * item.quantity));
}

final cartProvider = StateNotifierProvider<CartNotifier, List<CartItem>>(
  (ref) => CartNotifier(),
);
