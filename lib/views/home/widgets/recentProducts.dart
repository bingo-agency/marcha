import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:marcha/helper/imageList.dart';
import 'package:marcha/views/listing/listing.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../models/product.dart';
import '../../../state/DataBase.dart';
// import '../../../state/DataBase.dart';

class RecentProducts extends StatelessWidget {
  const RecentProducts({super.key});

  @override
  Widget build(BuildContext context) {
    // final DataBase _productController = Get.put(DataBase());
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
                        builder: (BuildContext context) => Listing(curl: '*'),
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
                return MasonryGridView.count(
                  itemCount: controller.products.length,
                  physics: const NeverScrollableScrollPhysics(),
                  addAutomaticKeepAlives: true,
                  shrinkWrap: true,
                  crossAxisCount: 3,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                  itemBuilder: (context, index) {
                    return Tile(
                      title: controller.products[index]['title'],
                      price: controller.products[index]['price'],
                      category: controller.products[index]['category'],
                      thumbnail: controller.products[index]['thumbnail'],
                      index: index,
                      extent: (index % 2 + 4) * 60,
                    );
                  },
                );
              }),
        ],
      ),
    );
  }
}

productCard() {
  return Container(
    decoration: const BoxDecoration(
      color: Colors.grey,
      borderRadius: BorderRadius.only(topRight: Radius.circular(25.0)),
    ),
  );
}

class Tile extends StatelessWidget {
  final int index;
  final double extent;
  final String title;
  final int price;
  final String category;
  final String thumbnail;
  const Tile({
    Key? key,
    required this.index,
    required this.extent,
    required this.title,
    required this.price,
    required this.category,
    required this.thumbnail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(8),
        ),
        height: extent,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Stack(
            fit: StackFit.expand,
            children: [
              CachedNetworkImage(
                imageUrl: thumbnail.toString(),
                fit: BoxFit.cover,
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  color: Colors.white54,
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                  color:
                                      Theme.of(context).secondaryHeaderColor),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              category,
                              style: TextStyle(
                                  fontSize: 10.0,
                                  fontWeight: FontWeight.bold,
                                  color:
                                      Theme.of(context).secondaryHeaderColor),
                            ),
                          ],
                        ),
                      ),
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: Text(
                            price.toString(),
                            style: TextStyle(
                                // fontSize: 13.0,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
