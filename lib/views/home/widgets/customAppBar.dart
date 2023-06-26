import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:marcha/views/search/filters.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import '../drawer/myDrawer.dart';

customAppBar(context) {
  return AppBar(
    automaticallyImplyLeading: false,
    centerTitle: false,
    backgroundColor: Colors.transparent,
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
    title: Card(
      margin: const EdgeInsets.all(0.0),
      clipBehavior: Clip.hardEdge,
      elevation: 5.0,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () async {
          print('cool');
          // searchBottomSheet(context);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const FiltersScreen(),
            ),
          );
        },
        child: SizedBox(
          height: 50.0,
          // width: MediaQuery.of(context).size.width * 2,
          child: ListTile(
            leading: Icon(FeatherIcons.search,
                color: Theme.of(context).primaryColor),
            title: AnimatedTextKit(
              animatedTexts: [
                TyperAnimatedText(
                  'Search Products ... ',
                ),
                TyperAnimatedText(
                  'iPhone X 64GB',
                ),
                TyperAnimatedText(
                  'Macbook pro 2012',
                ),
                TyperAnimatedText('Honda Civic 95'),
                TyperAnimatedText(
                  '5 Marla Plot in Murree',
                ),
                TyperAnimatedText(
                  'Leather Jacket',
                ),
                TyperAnimatedText(
                  'Shop in Bahria Town phase 4',
                ),
                TyperAnimatedText(
                  'Product ID # ',
                ),
                TyperAnimatedText(
                  'Google pixel 3a XL ',
                )
              ],
            ),
            trailing: ElevatedButton(
                onPressed: () {
                  print('Filters were tapped. !!!');
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) => const FiltersScreen(),
                    ),
                  );
                },
                child: const Icon(FeatherIcons.sliders)),
          ),
        ),
      ),
    ),
  );
}
