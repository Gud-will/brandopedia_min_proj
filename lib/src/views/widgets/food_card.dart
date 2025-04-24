import 'package:brandopedia_min_proj/src/models/food_item.dart';
import 'package:flutter/material.dart';

import '../../models/cart_item.dart';
import '../../providers/cart_notifier.dart';

class FoodItemCard extends StatelessWidget {
  final FoodItem item;
  final VoidCallback trigger;
  final CartNotifier cartNotifier;
  const FoodItemCard({
    super.key,
    required this.item,
    required this.cartNotifier,
    required this.trigger,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Image container
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: NetworkImage(item.imageUrl),
                // Use NetworkImage for network images
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 16), // Space between image and text
          // Text and button column
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  item.name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "\$ ${item.price}",
                  style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                ),
                const SizedBox(height: 8),
                TextButton(
                  onPressed: () {
                    trigger();
                    cartNotifier.addToCart(
                      CartItem(
                        foodName: item.name,
                        price: item.price,
                        quantity: 1,
                        imageUrl: item.imageUrl,
                        foodRestaurent: item.restaurantName,
                      ),
                    );
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.deepOrange,
                    padding: EdgeInsets.zero,
                  ),
                  child: const Text("Add to Cart"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
