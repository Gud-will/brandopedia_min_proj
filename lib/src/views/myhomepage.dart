import 'dart:async';
import 'package:lottie/lottie.dart' show Lottie;
import 'my_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/cart_notifier.dart';
import '../providers/food_items_notifier.dart' show foodItemsProvider;
import 'widgets/category_card.dart' show CategoryCard;
import 'widgets/coupons_card.dart';
import 'widgets/food_card.dart';

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key});

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  bool _showConfetti = false;

  void triggerConfetti() {
    setState(() => _showConfetti = true);

    // Hide after 0.5 seconds
    Timer(const Duration(milliseconds: 700), () {
      if (mounted) {
        setState(() => _showConfetti = false);
      }
    });
  }

  List<String> categories = ["Food", "Beverages", "Offers", "Favourites"];
  List<IconData> categoriesIcon = [
    Icons.fastfood,
    Icons.local_drink,
    Icons.local_offer_sharp,
    Icons.favorite,
  ];
  @override
  Widget build(BuildContext context) {
    final foodItems = ref.watch(foodItemsProvider);
    final cart = ref.watch(cartProvider);
    final cartNotifier = ref.read(cartProvider.notifier);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Chennai",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      CircleAvatar(
                        backgroundColor: Color.fromRGBO(78, 41, 171, 1),
                        child: Icon(Icons.person),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                SearchBar(
                  hintText: "Search For Restaurents or dishes",
                  leading: Icon(Icons.search),
                ),
                SizedBox(height: 10),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ...List.generate(
                              4,
                              (index) => Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 9,
                                  vertical: 2,
                                ),
                                child: CategoryCard(
                                  categoryicon: categoriesIcon[index],
                                  categoryname: categories[index],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 200, child: CouponsCard()),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2),
                          child: Divider(height: 2),
                        ),
                        Text(
                          "Explore",
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        foodItems.when(
                          data:
                              (items) => ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (ctx, index) {
                                  return FoodItemCard(
                                    item: items[index],
                                    cartNotifier: cartNotifier,
                                    trigger: triggerConfetti,
                                  );
                                },
                                itemCount: items.length,
                              ),
                          loading: () => CircularProgressIndicator(),
                          error: (e, s) => Text('Error: $e'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (_showConfetti)
            Center(
              child: Lottie.asset(
                'assets/confetti.json',
                height: 300,
                width: 300,
              ),
            ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          if (index == 2) {
            Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (ctx) => MyCart()));
          }
        },
        selectedItemColor: Color(0xFF6A1B9A),
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.card_travel), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
      ),
    );
  }
}
