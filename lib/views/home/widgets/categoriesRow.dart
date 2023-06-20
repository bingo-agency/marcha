import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../helper/categoriesHelper.dart';

class CategoriesRow extends StatelessWidget {
  const CategoriesRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Categories',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'View All',
                  style: TextStyle(
                      color: Theme.of(context).disabledColor,
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 10),
            height: 110,
            child: ListView.builder(
              itemCount: CategoriesHelper.categories.length,
              itemBuilder: (context, index) {
                return categoryCard(index);
              },
              scrollDirection: Axis.horizontal,
            ),
          ),
        ],
      ),
    );
  }
}

categoryCard(index) {
  return Stack(
    children: [
      Container(
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(154, 98, 89, 89),
              blurRadius: 5,
              offset: Offset(0.1, 0.1),
            ),
          ],
          color: Colors.grey[300],
          borderRadius:
              const BorderRadius.only(topRight: Radius.circular(25.0)),
        ),
        margin: const EdgeInsets.only(right: 10.0, top: 2.0, bottom: 2.0),
        width: 100,
        height: 100,
      ),
      CachedNetworkImage(
        imageUrl: CategoriesHelper.categories[index],
        fit: BoxFit.cover,
        width: 100,
        height: 100,
      ),
    ],
  );
}
