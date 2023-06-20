import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marcha/views/home/widgets/customAppBar.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import '../../state/DataBase.dart';
import 'widgets/categoriesRow.dart';
import 'widgets/imageSlider.dart';
import 'widgets/recentProducts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          //2
          SliverAppBar(
            expandedHeight: 300.0,
            flexibleSpace: const FlexibleSpaceBar(
              background: Image(
                fit: BoxFit.cover,
                alignment: Alignment.topLeft,
                image: AssetImage(
                  "assets/images/HeroSection.png",
                ),
              ),
            ),
            pinned: true,
            snap: true,
            floating: true,
            centerTitle: false,
            actions: [
              InkWell(
                onTap: () {
                  //check logged in user.
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: CircleAvatar(
                    radius: 30.0,
                    backgroundColor: Theme.of(context).primaryColor,
                    child: Icon(
                      FeatherIcons.user,
                      size: 20.0,
                      color: Theme.of(context).backgroundColor,
                    ),
                  ),
                ),
              ),
            ],
            toolbarHeight: 100.0,
            leading: InkWell(
              onTap: () {
                //check logged in user.
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: CircleAvatar(
                  radius: 30.0,
                  backgroundColor: const Color.fromARGB(153, 139, 195, 74),
                  child: Icon(
                    FeatherIcons.alignLeft,
                    size: 20.0,
                    weight: 100.0,
                    color: Theme.of(context).backgroundColor,
                  ),
                ),
              ),
            ),
            bottom: customAppBar(context),
          ),
          //3
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (_, int index) {
                return const Column(
                  children: [
                    ImageSlider(),
                    CategoriesRow(),
                    RecentProducts(),
                    Text('123'),
                    Text('123'),
                    Text('123'),
                    Text('123'),
                    Text('123'),
                    Text('123'),
                    Text('123'),
                    Text('123'),
                    Text('123'),
                    Text('123'),
                    Text('123'),
                    Text('123'),
                    Text('123'),
                    Text('123'),
                    Text('123'),
                    Text('123'),
                    Text('123'),
                    Text('123'),
                    Text('123'),
                    Text('123'),
                    Text('123'),
                    Text('123'),
                    Text('123'),
                    Text('123'),
                    Text('123'),
                    Text('123'),
                    Text('123'),
                    Text('123'),
                    Text('123'),
                    Text('123'),
                    Text('123'),
                    Text('123'),
                    Text('123'),
                    Text('123'),
                    Text('123'),
                    Text('123'),
                    Text('123'),
                    Text('123'),
                    Text('123'),
                    Text('123'),
                    Text('123'),
                    Text('123'),
                    Text('123'),
                    Text('123'),
                    Text('123'),
                    Text('123'),
                    Text('123'),
                    Text('123'),
                  ],
                );
              },
              childCount: 1,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.find<DataBase>().incrementCounter();
        },
        child: const Icon(Icons.add),
      ),

      // Container(
      //   decoration: const BoxDecoration(
      //     color: Colors.white,
      //     borderRadius: BorderRadius.only(
      //       topLeft: Radius.circular(30.0),
      //       topRight: Radius.circular(30.0),
      //     ),
      //   ),
      //   child: BottomNavigationBar(
      //     items: const <BottomNavigationBarItem>[
      //       BottomNavigationBarItem(
      //         icon: Icon(FeatherIcons.home),
      //         label: 'Home',
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(FeatherIcons.search),
      //         label: 'Search',
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(FeatherIcons.list),
      //         label: 'My Ads',
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(FeatherIcons.bookmark),
      //         label: 'Saved Ads',
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(FeatherIcons.user),
      //         label: 'Profile',
      //       ),
      //     ],
      //     // currentIndex: Get.find<DataBase>().selectedIndex as,
      //     selectedItemColor: Theme.of(context).primaryColor,
      //     // onTap: (index) => Get.find<DataBase>().selectedIndex = index as RxInt,
      //     onTap: (index) {
      //       // Get.find<DataBase>().selectedIndex = index as RxInt;
      //     },
      //   ),
      // ),
    );
  }
}
