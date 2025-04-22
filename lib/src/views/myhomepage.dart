import 'package:flutter/material.dart';

import 'widgets/category_card.dart' show CategoryCard;
import 'widgets/coupons_card.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
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
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (ctx, index) {
                        return Container(
                          color: Colors.white,
                          child: ListTile(
                            minLeadingWidth: 0,
                            contentPadding: const EdgeInsets.all(0.0),
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.network(
                                'https://cdn.pixabay.com/photo/2017/12/09/08/18/pizza-3007395_960_720.jpg',
                                width: 80,
                                height: 150,
                                fit: BoxFit.fill,
                              ),
                            ),
                            title: Text("Margherita Pizza"),
                            subtitle: Text("₹ 150"),
                            trailing: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF6A1B9A),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              onPressed: () {},
                              child: Text("Add to Cart"),
                            ),
                          ),
                        );
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
                      },
                      itemCount: 10,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color(0xFF6A1B9A),
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
      ),
    );
  }
}
