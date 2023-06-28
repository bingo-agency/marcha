import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shimmer/shimmer.dart';

class ProductsLoading extends StatelessWidget {
  const ProductsLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.black12,
      highlightColor: Colors.white,
      child: MasonryGridView.count(
        itemCount: 20,
        physics: const NeverScrollableScrollPhysics(),
        addAutomaticKeepAlives: true,
        shrinkWrap: true,
        crossAxisCount: 3,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        itemBuilder: (context, index) {
          return loadingTile(
            index: index,
            extent: (index % 2 + 4) * 60,
          );
        },
      ),
    );
  }
}

Widget loadingTile({required int index, required double extent}) {
  return Card(
    elevation: 5.0,
    child: Container(
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(8),
      ),
      height: extent,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              color: Colors.grey,
            ),
            // CachedNetworkImage(
            //   imageUrl: thumbnail.toString(),
            //   fit: BoxFit.cover,
            // ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.white54,
                padding: const EdgeInsets.all(10),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('title'),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'category',
                          ),
                        ],
                      ),
                    ),
                    Card(
                      child: Padding(
                        padding: EdgeInsets.all(7.0),
                        child: Text(
                          'price',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
