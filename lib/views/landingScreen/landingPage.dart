import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marcha/views/auth/profile.dart';
import 'package:marcha/views/favouriteAds/favouriteAds.dart';
import 'package:marcha/views/myAds/myAds.dart';
import 'package:marcha/views/search/search.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import '../../state/DataBase.dart';
import '../home/home.dart';

class LandingPage extends StatelessWidget {
  final TextStyle unselectedLabelStyle = TextStyle(
      color: Colors.white.withOpacity(0.5),
      fontWeight: FontWeight.w500,
      fontSize: 12);

  final TextStyle selectedLabelStyle =
      TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12);

  buildBottomNavigationMenu(context, landingPageController) {
    return Obx(() => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: SizedBox(
          height: 60,
          child: BottomNavigationBar(
            showUnselectedLabels: true,
            showSelectedLabels: true,
            onTap: landingPageController.changeTabIndex,
            currentIndex: landingPageController.tabIndex.value,
            backgroundColor: Theme.of(context).primaryColor,
            unselectedItemColor: Colors.grey.withOpacity(0.5),
            selectedItemColor: Theme.of(context).primaryColor,
            unselectedLabelStyle: unselectedLabelStyle,
            selectedLabelStyle: selectedLabelStyle,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(FeatherIcons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(FeatherIcons.search),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(FeatherIcons.list),
                label: 'My Ads',
              ),
              BottomNavigationBarItem(
                icon: Icon(FeatherIcons.bookmark),
                label: 'Saved Ads',
              ),
              BottomNavigationBarItem(
                icon: Icon(FeatherIcons.user),
                label: 'Profile',
              ),
            ],
          ),
        )));
  }

  @override
  Widget build(BuildContext context) {
    final DataBase landingPageController =
        Get.put(DataBase(), permanent: false);
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar:
          buildBottomNavigationMenu(context, landingPageController),
      body: Obx(() => IndexedStack(
            index: landingPageController.tabIndex.value,
            children: const [
              HomeScreen(),
              SearchScreen(),
              MyAds(),
              FavouriteAds(),
              ProfileScreen(),
            ],
          )),
    ));
  }
}
