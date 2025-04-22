import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.deepPurple.shade100,
            shape: BoxShape.circle,
          ),
          padding: EdgeInsets.all(10),
          child: Icon(Icons.fastfood, color: Colors.deepPurple),
        ),
        SizedBox(height: 4),
        Text("Food"),
      ],
    );
  }
}
