import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marcha/views/home/drawer/myDrawer.dart';
import 'package:marcha/views/home/widgets/customAppBar.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import '../../state/DataBase.dart';
import '../addProduct/addNewProduct.dart';
import '../auth/login.dart';
import 'widgets/categoriesRow.dart';
import 'widgets/city.dart';
import 'widgets/imageSlider.dart';
import 'widgets/recentProducts.dart';
import 'package:flutter_scrolling_fab_animated/flutter_scrolling_fab_animated.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_svg/svg.dart';
import 'widgets/topSellers.dart';
import '../auth/authController.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final firestore = FirebaseFirestore.instance;
    var dbclass = Get.put(DataBase());
    dbclass.addCategories();

    // firestore.collection('/').add(dbclass.categories as Map<String, dynamic>);

    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    ScrollController scrollController = ScrollController();
    return Scaffold(
      body: CustomScrollView(
        controller: scrollController,
        slivers: <Widget>[
          //2
          SliverAppBar(
            leading: Container(
              margin: const EdgeInsets.only(left: 5.0),
              padding: const EdgeInsets.all(3.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return MyDrawer(
                          animation: animation,
                        );
                      },
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        return SlideTransition(
                          position: Tween<Offset>(
                            begin: const Offset(-1.0, 0.0),
                            end: Offset.zero,
                          ).animate(animation),
                          child: child,
                        );
                      },
                    ),
                  );
                },
                child: CircleAvatar(
                  backgroundColor: Theme.of(context).primaryColor,
                  child: SvgPicture.asset('assets/icons/menu.svg',
                      color: Theme.of(context).backgroundColor),
                ),
              ),
            ),
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
          'Sell ',
          style: TextStyle(color: Colors.white, fontSize: 16.0),
        ),
        onPress: () async {
          print('add was hit');

          if (AuthController().isGoogleUserLoggedIn) {
            print('User is loggedin');
            Get.to(Login());
          } else {
            print('User is not loggedin');
            Get.to(AddNewProduct(id: AuthController().userId.toString()));
            // User is not logged in with Google
          }
          // if (dbclass.id == "") {
          // print(dbclass.getEmail());
          // Navigator.of(context).push(
          //   MaterialPageRoute(
          //     builder: (BuildContext context) => Login(),
          //   ),
          // );
          // } else {
          // print(dbclass.email);
          // Navigator.of(context).push(
          //   MaterialPageRoute(
          //     builder: (BuildContext context) =>
          //         AddNewProperty(id: dbclass.id),
          //   ),
          // );
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
