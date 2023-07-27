import 'package:flutter/material.dart';

import 'package:marcha/helper/imageList.dart';
import 'package:marcha/views/listing/productTile.dart';
import 'package:marcha/views/widgets/productsLoading.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../models/product.dart';
import '../../../state/DataBase.dart';
import '../home/widgets/recentProducts.dart';

class ProductListing extends StatelessWidget {
  final String curl;
  const ProductListing({required this.curl, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 300,
              child: Text('Back ?'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Align(
                  //   alignment: Alignment.topLeft,
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       Text(
                  //         'Products',
                  //         style: TextStyle(
                  //             color: Theme.of(context).primaryColor,
                  //             fontSize: 22.0,
                  //             fontWeight: FontWeight.bold),
                  //       ),
                  //       Text(
                  //         'View All',
                  //         style: TextStyle(
                  //             color: Theme.of(context).disabledColor,
                  //             fontSize: 12.0,
                  //             fontWeight: FontWeight.bold),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  GetBuilder<DataBase>(
                      init: DataBase(),
                      builder: (controller) {
                        return (controller.products.isEmpty)
                            ? const ProductsLoading()
                            : MasonryGridView.count(
                                itemCount: controller.products.length,
                                physics: const NeverScrollableScrollPhysics(),
                                addAutomaticKeepAlives: true,
                                shrinkWrap: true,
                                crossAxisCount: 3,
                                mainAxisSpacing: 4,
                                crossAxisSpacing: 4,
                                itemBuilder: (context, index) {
                                  return ProductTile(
                                    prod: controller.products[index],
                                    title: controller.products[index]['title'],
                                    price: controller.products[index]['price'],
                                    category: controller.products[index]
                                        ['category'],
                                    thumbnail: controller.products[index]
                                        ['thumbnail'],
                                    index: index,
                                    extent: (index % 2 + 4) * 60,
                                  );
                                },
                              );
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
