import 'package:brandopedia_min_proj/src/views/my_cart.dart';
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
  @override
  Widget build(BuildContext context) {
    final foodItems = ref.watch(foodItemsProvider);
    final cart = ref.watch(cartProvider);
    final cartNotifier = ref.read(cartProvider.notifier);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Chennai"),
                  CircleAvatar(
                    backgroundColor: Color.fromRGBO(78, 41, 171, 1),
                    child: Icon(Icons.person),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            SearchBar(),
            SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ...List.generate(4, (index) => CategoryCard()),
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

// return Container(
                        //   color: Colors.white,
                        //   child: ListTile(
                        //     minLeadingWidth: 0,
                        //     contentPadding: const EdgeInsets.all(0.0),
                        //     leading: ClipRRect(
                        //       borderRadius: BorderRadius.circular(15),
                        //       child: Image.network(
                        //         'https://cdn.pixabay.com/photo/2017/12/09/08/18/pizza-3007395_960_720.jpg',
                        //         width: 80,
                        //         height: 150,
                        //         fit: BoxFit.fill,
                        //       ),
                        //     ),
                        //     title: Text("Margherita Pizza"),
                        //     subtitle: Text("₹ 150"),
                        //     trailing: ElevatedButton(
                        //       style: ElevatedButton.styleFrom(
                        //         backgroundColor: Color(0xFF6A1B9A),
                        //         shape: RoundedRectangleBorder(
                        //           borderRadius: BorderRadius.circular(8),
                        //         ),
                        //       ),
                        //       onPressed: () {},
                        //       child: Text("Add to Cart"),
                        //     ),
                        //   ),
                        // );
                        // return Padding(
                        //   padding: const EdgeInsets.all(8.0),
                        //   child: Container(
                        //     padding: const EdgeInsets.symmetric(horizontal: 5),
                        //     child: Row(
                        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //       children: [
                        //         Container(
                        //           width: 90,
                        //           height: 90,
                        //           decoration: const BoxDecoration(
                        //             color: Colors.red,
                        //             borderRadius: BorderRadius.all(
                        //               Radius.circular(15),
                        //             ),
                        //           ),
                        //         ),
                        //         Column(
                        //           children: [
                        //             Text("Margherita Pizza"),
                        //             Text("\$ 150"),
                        //             TextButton(
                        //               onPressed: () {},
                        //               child: Text("Add to Cart"),
                        //             ),
                        //           ],
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // );