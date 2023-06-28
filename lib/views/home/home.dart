import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marcha/views/home/drawer/myDrawer.dart';
import 'package:marcha/views/home/widgets/customAppBar.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import '../../state/DataBase.dart';
import 'widgets/categoriesRow.dart';
import 'widgets/city.dart';
import 'widgets/imageSlider.dart';
import 'widgets/recentProducts.dart';
import 'package:flutter_scrolling_fab_animated/flutter_scrolling_fab_animated.dart';

import 'widgets/topSellers.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    ScrollController scrollController = ScrollController();
    return Scaffold(
      body: CustomScrollView(
        controller: scrollController,
        slivers: <Widget>[
          //2
          SliverAppBar(
            expandedHeight: 220.0,
            flexibleSpace: const FlexibleSpaceBar(
              background: ImageSlider(),
            ),
            pinned: true,
            snap: true,
            floating: true,
            centerTitle: false,
            toolbarHeight: 115.0,
            bottom: customAppBar(context),
          ),
          //3
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (_, int index) {
                return const Column(
                  children: [
                    CategoriesRow(),
                    RecentProducts(),
                    City(),
                    TopSellers(),
                  ],
                );
              },
              childCount: 1,
            ),
          ),
        ],
      ),
      floatingActionButton: ScrollingFabAnimated(
        icon: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        text: const Text(
          'Add ',
          style: TextStyle(color: Colors.white, fontSize: 16.0),
        ),
        onPress: () async {
          print('add was hit');
          // if (dbclass.id == "") {
          //   // print(dbclass.getEmail());
          //   Navigator.of(context).push(
          //     MaterialPageRoute(
          //       builder: (BuildContext context) => const Login(),
          //     ),
          //   );
          // } else {
          //   // print(dbclass.email);
          //   Navigator.of(context).push(
          //     MaterialPageRoute(
          //       builder: (BuildContext context) =>
          //           AddNewProperty(id: dbclass.id),
          //     ),
          //   );
          // }
        },
        scrollController: scrollController,
        animateIcon: true,
        // limitIndicator: 1.0,
        curve: Curves.easeInOut,
        inverted: false,
        radius: 10.0,
      ),
    );
  }
}
