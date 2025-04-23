import 'package:brandopedia_min_proj/src/views/widgets/cart_item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/cart_notifier.dart';

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
        title: Text("Cart"),
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 30,
            left: 18,
            right: 18,
            bottom: 50,
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
                  Text(cartNotifier.totalPrice.toString()),
                ],
              ),
              ElevatedButton(onPressed: () {}, child: Text("Order Now")),
            ],
          ),
        ),
      ),
    );
  }
}
