import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import '../../../helper/categoriesHelper.dart';
import '../../../state/DataBase.dart';
import '../../sellers/sellerDetail.dart';
import '../../widgets/sellersLoading.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class TopSellers extends StatelessWidget {
  const TopSellers({super.key});

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
                  'Top Sellers',
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
            padding: const EdgeInsets.all(15),
            height: 300,
            child: GetBuilder<DataBase>(
              init: DataBase(),
              builder: (value) {
                return value.isLoading
                    ? const SellersLoading()
                    : ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount:
                            CategoriesHelper.categories['categories'].length,
                        itemBuilder: (context, index) {
                          final topSellers =
                              CategoriesHelper.categories['categories'][index];
                          // return Text(topSellers.toString());
                          return TempCard(map: topSellers);
                        },
                      );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class TempCard extends StatelessWidget {
  TempCard({Key? key, required this.map}) : super(key: key);
  var map;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // print(map);
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return SellerDetail(id: map['id']);
            },
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        width: 150,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Stack(
          children: [
            CachedNetworkImage(
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                imageUrl: 'https://www.teamworkpk.com/img/avatardefault.png',
                fit: BoxFit.fitWidth,
                //make it cover instead, fitwidth isn't the right solution.
                width: 150,
                height: 300),
            // Positioned(
            //   right: 15,
            //   top: 15,
            //   child: Card(
            //     color: Theme.of(context).primaryColor,
            //     child: Padding(
            //       padding: const EdgeInsets.all(7.0),
            //       child: Text(
            //         'Featured',
            //         style: TextStyle(
            //             fontWeight: FontWeight.bold,
            //             color: Theme.of(context).colorScheme.background),
            //       ),
            //     ),
            //   ),
            // ),
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
                            map['name'],
                            style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).secondaryHeaderColor),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Row(
                            children: [
                              Icon(FeatherIcons.star, color: Colors.yellow),
                              Icon(FeatherIcons.star, color: Colors.yellow),
                              Icon(FeatherIcons.star, color: Colors.yellow),
                              Icon(FeatherIcons.star, color: Colors.yellow),
                            ],
                          ),
                          // Text(
                          //   '5 Stars',
                          //   style: TextStyle(
                          //       fontSize: 12.0,
                          //       fontWeight: FontWeight.bold,
                          //       color: Theme.of(context).secondaryHeaderColor),
                          // ),
                        ],
                      ),
                    ),
                    // Card(
                    //   child: Padding(
                    //     padding: const EdgeInsets.all(7.0),
                    //     child: Text(
                    //       'Ratings 5*',
                    //       style: TextStyle(
                    //           // fontSize: 13.0,
                    //           fontWeight: FontWeight.bold,
                    //           color: Theme.of(context).primaryColor),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
