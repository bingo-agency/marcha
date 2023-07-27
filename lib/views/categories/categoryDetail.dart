import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:marcha/state/DataBase.dart';

class CategoryDetail extends StatelessWidget {
  final Map<String, dynamic> category;
  const CategoryDetail({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    List<dynamic> subCategories = category['subCategories'];

    List<Widget> tabs = [];
    List<Widget> tabViews = [];

    for (int i = 0; i < subCategories.length; i++) {
      tabs.add(Tab(
        child: Text(subCategories[i]['name']),
      ));
    }
    for (int i = 0; i < subCategories.length; i++) {
      tabViews.add(Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(subCategories[i]['name']),
      ));
    }
    print(category.toString());
    // final List<dynamic> subCategories = category['subCategories'];

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 300,
                  child: CachedNetworkImage(
                    height: 300,
                    width: double.infinity,
                    alignment: Alignment.centerLeft,
                    imageUrl: category['imageUrl'],
                    fit: BoxFit.fitWidth,
                  ),
                ),
                AppBar(
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                ),
                Container(
                  height: 300,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black12, // Start color
                        Colors.black, // End color
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 15,
                  left: 15,
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/icons/' + category['icon'],
                          color: Colors.white),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Text(category['name'],
                          style: TextStyle(
                              fontSize: 42,
                              color: Theme.of(context).backgroundColor)),
                    ],
                  ),
                ),
              ],
            ),
            // subCategoryList(category['subCategories']),

            DefaultTabController(
              length: tabs.length,
              initialIndex: 0,
              animationDuration: kThemeAnimationDuration,
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: <Widget>[
                    TabBar(
                      isScrollable: true,
                      dragStartBehavior: DragStartBehavior.start,
                      automaticIndicatorColorAdjustment: true,
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicator: UnderlineTabIndicator(
                          borderSide: BorderSide(
                              width: 1.0,
                              color: Theme.of(context).primaryColor),
                          insets: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                          )),
                      tabs: tabs,
                    ),
                    Expanded(
                      child: TabBarView(
                        dragStartBehavior: DragStartBehavior.start,
                        children: tabViews,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // TabBarView(children: tabViews),

            // DefaultTabController(
            //   length: category['subCategories'].length,
            //   child: ListView.builder(
            //     primary: false,
            //     shrinkWrap: true,
            //     itemCount: category['subCategories'].length,
            //     itemBuilder: (context, index) {
            //       return TabBar(
            //         tabs: category['subCategories'][index]['name']
            //             .map<Tab>((name) => Tab(text: name))
            //             .toList(),
            //       );
            //     },
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}

Widget subCategoryList(List<dynamic> subList) {
  return Container(
    margin: const EdgeInsets.only(top: 5.0),
    child: SizedBox(
      height: 45,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: subList.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(0),
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(0),
                  topRight: Radius.circular(12.0)),
              color: Theme.of(context).primaryColor,
            ),
            margin: const EdgeInsets.only(left: 5.0, right: 5.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                subList[index]['name'],
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                ),
              ),
            ),
          );
        },
      ),
    ),
  );
}
