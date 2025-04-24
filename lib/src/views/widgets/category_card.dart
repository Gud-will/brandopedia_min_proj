import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String categoryname;
  final IconData categoryicon;
  const CategoryCard({
    super.key,
    required this.categoryname,
    required this.categoryicon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.deepPurple.shade100,
            shape: BoxShape.circle,
          ),
          padding: EdgeInsets.all(12),
          child: Icon(categoryicon, color: Colors.deepPurple),
        ),
        SizedBox(height: 4),
        Text(categoryname),
      ],
    );
  }
}
