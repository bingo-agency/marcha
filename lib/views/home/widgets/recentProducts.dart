import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:marcha/views/listing/productListing.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:marcha/views/listing/productDetail.dart';
import 'package:marcha/views/listing/productTile.dart';
import 'package:marcha/views/widgets/productsLoading.dart';
import '../../../state/DataBase.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RecentProducts extends StatelessWidget {
  const RecentProducts({super.key});

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
                  'Products',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const ProductListing(curl: '*'),
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
          GetBuilder<DataBase>(
              init: DataBase(),
              builder: (controller) {
                if (controller.products.isEmpty) {
                  print('its empty');
                  return const ProductsLoading();
                } else {
                  return MasonryGridView.count(
                    itemCount: controller.products.length,
                    physics: const NeverScrollableScrollPhysics(),
                    addAutomaticKeepAlives: true,
                    shrinkWrap: true,
                    crossAxisCount: 3,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                    itemBuilder: (context, index) {
                      return ProductTile(
                        prod: controller.products[index],
                        title: controller.products[index]['title'],
                        price: controller.products[index]['price'],
                        category: controller.products[index]['category'],
                        thumbnail: controller.products[index]['thumbnail'],
                        index: index,
                        extent: (index % 2 + 4) * 60,
                      );
                    },
                  );
                }
              }),
        ],
      ),
    );
  }
}
