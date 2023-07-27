import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:photo_view/photo_view.dart';
import 'package:share_plus/share_plus.dart';

class ProductDetail extends StatelessWidget {
  final Map<String, dynamic> map;
  const ProductDetail({super.key, required this.map});

  @override
  Widget build(BuildContext context) {
    List productImages = map['product_images'];
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 300,
                  child:
                      // Text(productImages.length.toString()),

                      CarouselSlider.builder(
                    itemCount: productImages.length,
                    itemBuilder: (BuildContext context, index, realIndex) {
                      if (productImages.isEmpty) {
                        print(productImages[index].toString());
                        return const Center(
                          child: Text('No Product Images found.'),
                        );
                      } else {
                        return Container(
                          margin: const EdgeInsets.only(
                              right: 0.0, top: 0, left: 0),
                          child: SizedBox(
                            height: double.infinity,
                            width: double.infinity,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        HeroPhotoViewRouteWrapper(
                                      index: index,
                                      imageProvider: CachedNetworkImageProvider(
                                        productImages[index]['imageUrl']
                                            .toString(),
                                      ),
                                    ),
                                  ),
                                );
                              },
                              child: Hero(
                                tag: index,
                                child: CachedNetworkImage(
                                  progressIndicatorBuilder:
                                      (context, url, progress) {
                                    return const Center(
                                        child: CircularProgressIndicator());
                                  },
                                  imageUrl: productImages[index]['imageUrl']
                                      .toString(),
                                  fit: BoxFit.cover,
                                  useOldImageOnUrlChange: false,
                                  fadeInDuration:
                                      const Duration(milliseconds: 100),
                                  // width: MediaQuery.of(context).size.width,
                                  // height: MediaQuery.of(context).size.height / 1.75,
                                  // width: MediaQuery.of(context).size.width,

                                  // height: double.infinity,
                                  // width: double.infinity,
                                ),
                              ),
                            ),
                          ),
                        );
                      }
                    },
                    options: CarouselOptions(
                      height: 300,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 5),
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 300),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      viewportFraction: 1.0,
                      animateToClosest: true,
                      pageSnapping: true,

                      // enlargeFactor: 1.0,
                    ),
                  ),
                ),
                AppBar(
                  backgroundColor: Colors.transparent,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    map['title'],
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        map['price'],
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.favorite),
                        onPressed: () {
                          // Add to favourites
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    map['description'],
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Product Details',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Brand Category : ' + map['category'],
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Category: ' + map['category'],
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Purpose: ' + map['purpose'],
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Product Specifications',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "spec['name']",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "spec['value']",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HeroPhotoViewRouteWrapper extends StatelessWidget {
  const HeroPhotoViewRouteWrapper({
    Key? key,
    required this.imageProvider,
    required this.index,
    this.backgroundDecoration,
    this.minScale,
    this.maxScale,
  }) : super(key: key);

  final int index;
  final CachedNetworkImageProvider imageProvider;
  final BoxDecoration? backgroundDecoration;
  final dynamic minScale;
  final dynamic maxScale;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(
        height: MediaQuery.of(context).size.height,
      ),
      child: PhotoView(
        imageProvider: imageProvider,
        backgroundDecoration: backgroundDecoration,
        minScale: minScale,
        maxScale: maxScale,
        heroAttributes: PhotoViewHeroAttributes(tag: index),
      ),
    );
  }
}
