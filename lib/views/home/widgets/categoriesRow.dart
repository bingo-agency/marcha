import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:marcha/state/DataBase.dart';
import 'package:get/get.dart';
import 'package:marcha/views/categories/categories.dart';
import 'package:marcha/views/categories/categoryDetail.dart';
import 'package:marcha/views/listing/productListing.dart';
import 'package:marcha/views/widgets/categoriesLoading.dart';

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
                GestureDetector(
                  onTap: () {
                    print('View all categories.Expanded list.');
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) => const Categories(),
                      ),
                    );
                  },
                  child: Text(
                    'View All',
                    style: TextStyle(
                        color: Theme.of(context).disabledColor,
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 10),
            height: 110,
            child: GetBuilder<DataBase>(
                init: DataBase(),
                builder: (controller) {
                  return (controller.categories.isEmpty)
                      ? const CategoriesLoading()
                      : ListView.builder(
                          itemCount: controller.categories.length,
                          itemBuilder: (context, index) {
                            Map<String, dynamic> singleCat =
                                controller.categories[index];
                            return categoryCard(singleCat, context);
                          },
                          scrollDirection: Axis.horizontal,
                        );
                }),
          ),
        ],
      ),
    );
  }
}

categoryCard(index, context) {
  return Stack(
    children: [
      Container(
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(154, 98, 89, 89),
              blurRadius: 5,
              offset: Offset(0.0, 0.0),
            ),
          ],
          color: Colors.grey[100],
          borderRadius:
              const BorderRadius.only(topRight: Radius.circular(25.0)),
        ),
        margin: const EdgeInsets.only(right: 15.0, top: 2.0, bottom: 2.0),
        width: 100,
        height: 100,
      ),
      InkWell(
        onTap: () {
          Get.to(CategoryDetail(category: index));
          // Navigator.of(context).push(
          //   MaterialPageRoute(
          //     builder: (BuildContext context) =>
          //         const ProductListing(curl: '*'),
          //   ),
          // );
        },
        child: CachedNetworkImage(
          imageUrl: index['imageUrl'],
          fit: BoxFit.cover,
          width: 100,
          height: 100,
        ),
      ),
    ],
  );
}
