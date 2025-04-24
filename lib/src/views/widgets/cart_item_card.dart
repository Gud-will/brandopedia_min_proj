import 'package:brandopedia_min_proj/src/models/cart_item.dart';
import 'package:brandopedia_min_proj/src/providers/cart_notifier.dart';
import 'package:flutter/material.dart';

class CartItemCard extends StatefulWidget {
  final CartItem cartItem;
  final CartNotifier cartNotifier;

  const CartItemCard({
    Key? key,
    required this.cartItem,
    required this.cartNotifier,
  }) : super(key: key);

  @override
  State<CartItemCard> createState() => _CartItemCardState();
}

class _CartItemCardState extends State<CartItemCard>
    with SingleTickerProviderStateMixin {
  double _scale = 1.0;

  void _animate() {
    setState(() => _scale = 1.2);
    Future.delayed(Duration(milliseconds: 100), () {
      setState(() => _scale = 1.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Food image
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: NetworkImage(widget.cartItem.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 16),

          // Expanded content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title and price
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        widget.cartItem.foodName,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      '\$${widget.cartItem.price.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),

                // Restaurant name and quantity control
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.cartItem.foodRestaurent,
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    ),

                    // Quantity control
                    AnimatedScale(
                      scale: _scale,
                      duration: Duration(milliseconds: 150),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.grey[200],
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {
                                _animate();
                                widget.cartNotifier.updateQuantity(
                                  widget.cartItem.foodName,
                                  widget.cartItem.quantity - 1,
                                );
                              },
                              icon: const Icon(Icons.remove),
                              iconSize: 20,
                              constraints: BoxConstraints(),
                              padding: EdgeInsets.zero,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8.0,
                              ),
                              child: Text(
                                widget.cartItem.quantity.toString(),
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                _animate();
                                widget.cartNotifier.updateQuantity(
                                  widget.cartItem.foodName,
                                  widget.cartItem.quantity + 1,
                                );
                              },
                              icon: const Icon(Icons.add),
                              iconSize: 20,
                              constraints: BoxConstraints(),
                              padding: EdgeInsets.zero,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );

    // Padding(
    //   padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
    //   child: Row(
    //     crossAxisAlignment: CrossAxisAlignment.center,
    //     children: [
    //       // Image container
    //       Container(
    //         width: 80,
    //         height: 80,
    //         decoration: BoxDecoration(
    //           borderRadius: BorderRadius.circular(15),
    //           image: DecorationImage(
    //             image: NetworkImage(cartItem.imageUrl),
    //             // Use NetworkImage for network images
    //             fit: BoxFit.cover,
    //           ),
    //         ),
    //       ),
    //       const SizedBox(width: 16), // Space between image and text
    //       // Text and button column
    //       Expanded(
    //         child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: [
    //             Row(
    //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //               children: [
    //                 Text(
    //                   cartItem.foodName,
    //                   style: const TextStyle(
    //                     fontSize: 18,
    //                     fontWeight: FontWeight.bold,
    //                   ),
    //                 ),
    //                 Text("\$ ${cartItem.price}"),
    //               ],
    //             ),
    //             const SizedBox(height: 4),
    //             Row(
    //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //               children: [
    //                 Text(
    //                   cartItem.foodRestaurent,
    //                   style: TextStyle(fontSize: 16, color: Colors.grey[700]),
    //                 ),
    //                 Row(
    //                   mainAxisAlignment: MainAxisAlignment.end,
    //                   children: [
    //                     IconButton(
    //                       onPressed: () {
    //                         cartNotifier.updateQuantity(
    //                           cartItem.foodName,
    //                           cartItem.quantity - 1,
    //                         );
    //                       },
    //                       icon: Icon(Icons.minimize_outlined),
    //                     ),
    //                     Text(cartItem.quantity.toString()),
    //                     IconButton(
    //                       onPressed: () {
    //                         cartNotifier.updateQuantity(
    //                           cartItem.foodName,
    //                           cartItem.quantity + 1,
    //                         );
    //                       },
    //                       icon: Icon(Icons.add),
    //                     ),
    //                   ],
    //                 ),
    //               ],
    //             ),
    //           ],
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
