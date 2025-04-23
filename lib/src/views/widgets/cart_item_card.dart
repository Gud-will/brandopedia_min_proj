import 'package:brandopedia_min_proj/src/models/cart_item.dart';
import 'package:brandopedia_min_proj/src/providers/cart_notifier.dart';
import 'package:flutter/material.dart';

class CartItemCard extends StatelessWidget {
  final CartItem cartItem;
  final CartNotifier cartNotifier;

  const CartItemCard({
    Key? key,
    required this.cartItem,
    required this.cartNotifier,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Image container
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: NetworkImage(cartItem.imageUrl),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      cartItem.foodName,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text("\$ ${cartItem.price}"),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      cartItem.foodRestaurent,
                      style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () {
                            cartNotifier.updateQuantity(
                              cartItem.foodName,
                              cartItem.quantity - 1,
                            );
                          },
                          icon: Icon(Icons.minimize_outlined),
                        ),
                        Text(cartItem.quantity.toString()),
                        IconButton(
                          onPressed: () {
                            cartNotifier.updateQuantity(
                              cartItem.foodName,
                              cartItem.quantity + 1,
                            );
                          },
                          icon: Icon(Icons.add),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
