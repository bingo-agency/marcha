import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:marcha/state/DataBase.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:marcha/views/listing/productListing.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 200,
                  child: CachedNetworkImage(
                    imageUrl:
                        'https://static.vecteezy.com/system/resources/thumbnails/004/299/835/small/online-shopping-on-phone-buy-sell-business-digital-web-banner-application-money-advertising-payment-ecommerce-illustration-search-free-vector.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                AppBar(
                  backgroundColor: Colors.transparent,
                ),
              ],
            ),

            const SizedBox(height: 20),

            GetBuilder<DataBase>(
              init: DataBase(),
              builder: (controller) {
                return ListView.builder(
                  primary: false,
                  shrinkWrap: true,
                  itemCount: controller.categories.length,
                  itemBuilder: (context, index) {
                    var category = controller.categories[index];
                    var svg = 'assets/icons/' + category['icon'];
                    List<dynamic> subCategories = category['subCategories'];
                    return ExpansionTile(
                      leading: SvgPicture.asset(
                        svg,
                        color: Theme.of(context).primaryColor,
                      ),
                      title: Text(category['name'].toString()),
                      children: [
                        ListView.builder(
                          primary: false,
                          shrinkWrap: true,
                          itemCount: subCategories.length,
                          itemBuilder: (context, subIndex) {
                            var subCategory = subCategories[subIndex]['name'];
                            print(subCategory.toString());
                            return ListTile(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        const ProductListing(curl: '*'),
                                  ),
                                );
                              },
                              title: Text(subCategory),
                              trailing: Icon(FeatherIcons.arrowRight,
                                  color: Theme.of(context).primaryColor),
                            );
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            )

            // GetBuilder<DataBase>(
            //   init: DataBase(),
            //   builder: (controller) {
            //     return ListView.builder(
            //         primary: false,
            //         // physics: const NeverScrollableScrollPhysics(),

            //         shrinkWrap: true,
            //         itemCount: controller.categories.length,
            //         itemBuilder: ((context, index) {
            //           var svg = 'assets/icons/' +
            //               controller.categories[index]['icon'];
            //           return ExpansionTile(
            //             leading: SvgPicture.asset(
            //               svg,
            //               color: Theme.of(context).primaryColor,
            //             ),
            //             title: Text(controller.categories[index]['name']),
            //             children: [
            //               ListTile(
            //                 title: Text(controller.categories[index]
            //                         ['subCategories']['name']
            //                     .toString()),
            //               ),
            //             ],
            //             // trailing: Icon(FeatherIcons.arrowRight,
            //             //     color: Theme.of(context).primaryColor),
            //           );
            //         }));
            //   },
            // )
          ],
        ),
      ),
    );
  }
}
