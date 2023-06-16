import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import '../../state/DataBase.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _scrollController = ScrollController();
    bool _showSearchBar = true;
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Marcha'),
      // ),
      body: CustomScrollView(
        slivers: <Widget>[
          //2
          SliverAppBar(
              expandedHeight: 300.0,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text('Marcha', textScaleFactor: 1),
                background: CachedNetworkImage(
                  fit: BoxFit.fill,
                  imageUrl:
                      "https://flutteragency.com/wp-content/uploads/2020/06/SilverAppBar-widget.jpg",
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      CircularProgressIndicator(
                          value: downloadProgress.progress),
                  errorWidget: (context, url, error) =>
                      const Icon(FeatherIcons.bellOff),
                ),
              ),
              pinned: true,
              snap: true,
              floating: true,
              bottom: AppBar(
                backgroundColor: Colors.transparent,
                title: const Text('123'),
              )

              // AppBar(
              //   title: Container(

              //       child: TextField(
              //         decoration: InputDecoration(
              //             border: OutlineInputBorder(),
              //             hintText: 'Enter a search term'),
              //       )),
              // ),
              ),
          //3
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (_, int index) {
                return ListTile(
                  leading: Container(
                      padding: EdgeInsets.all(8),
                      width: 100,
                      child: Placeholder()),
                  title: Text('Place ${index + 1}', textScaleFactor: 2),
                );
              },
              childCount: 20,
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
    );
  }
}
