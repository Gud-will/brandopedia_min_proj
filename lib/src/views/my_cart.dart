import 'widgets/cart_item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/cart_notifier.dart';
import 'widgets/slide_to_order.dart';

class MyCart extends ConsumerStatefulWidget {
  const MyCart({super.key});

  @override
  ConsumerState<MyCart> createState() => _MyCartState();
}

class _MyCartState extends ConsumerState<MyCart> {
  @override
  Widget build(BuildContext context) {
    final cart = ref.watch(cartProvider);
    final cartNotifier = ref.read(cartProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Cart",
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 30,
            left: 18,
            right: 18,
            bottom: 14,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (ctx, index) {
                          return CartItemCard(
                            cartItem: cart[index],
                            cartNotifier: cartNotifier,
                          );
                        },
                        itemCount: cart.length,
                      ),
                    ],
                  ),
                ),
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(cartNotifier.totalPrice.toStringAsFixed(2)),
                ],
              ),
              SlideToPayButton(onSlideComplete: () {}),
              // TextButton(
              //   onPressed: () {
              //   },
              //   style: TextButton.styleFrom(
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(30),
              //     ),
              //     backgroundColor: Colors.blue,
              //     foregroundColor: Colors.white,
              //     padding: const EdgeInsets.symmetric(vertical: 16),
              //     minimumSize: const Size.fromHeight(
              //       50,
              //     ), // makes it occupy full width
              //   ),
              //   child: const Text('Click Me', style: TextStyle(fontSize: 16)),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
