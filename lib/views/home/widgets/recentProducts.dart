import 'package:flutter/material.dart';
import 'package:marcha/helper/imageList.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class RecentProducts extends StatelessWidget {
  const RecentProducts({super.key});

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
                  'Products',
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
          MasonryGridView.count(
            itemCount: ImageList.images.length,
            physics: const NeverScrollableScrollPhysics(),
            addAutomaticKeepAlives: true,
            shrinkWrap: true,
            crossAxisCount: 3,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
            itemBuilder: (context, index) {
              return Tile(
                imageList: ImageList.images,
                index: index,
                extent: (index % 2 + 4) * 60,
              );
            },
          ),
        ],
      ),
    );
  }
}

productCard() {
  return Container(
    decoration: const BoxDecoration(
      color: Colors.grey,
      borderRadius: BorderRadius.only(topRight: Radius.circular(25.0)),
    ),
  );
}

class Tile extends StatelessWidget {
  final int index;
  final double extent;
  final List imageList;
  const Tile({
    Key? key,
    required this.index,
    required this.extent,
    required this.imageList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      child: Container(
        color: Colors.grey[300],
        height: extent,
        child: CachedNetworkImage(
          imageUrl: imageList[index].toString(),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
