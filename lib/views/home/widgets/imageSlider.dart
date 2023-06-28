import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:marcha/views/widgets/bannerLoading.dart';

class ImageSlider extends StatelessWidget {
  const ImageSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Card(
              elevation: 5,
              // shape: RoundedRectangleBorder(
              //   borderRadius: BorderRadius.circular(10),
              //   side: const BorderSide(
              //     color: Colors.white10,
              //     width: 2,
              //     style: BorderStyle.solid,
              //   ),
              // ),
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: CachedNetworkImage(
                  placeholder: (context, url) => const BannerLoading(),
                  imageUrl:
                      'https://i.pinimg.com/originals/c3/ce/38/c3ce38d46de6a4f69e0a1fc8a227441d.jpg',
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Card(
              elevation: 5,
              // shape: RoundedRectangleBorder(
              //   borderRadius: BorderRadius.circular(10),
              //   side: const BorderSide(
              //     color: Colors.white10,
              //     width: 2,
              //     style: BorderStyle.solid,
              //   ),
              // ),
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: CachedNetworkImage(
                  placeholder: (context, url) => const BannerLoading(),
                  imageUrl:
                      'https://www.sliderrevolution.com/wp-content/uploads/2022/05/salesslider.jpg',
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Card(
              elevation: 5,
              // shape: RoundedRectangleBorder(
              //   borderRadius: BorderRadius.circular(10),
              //   side: const BorderSide(
              //     color: Colors.white10,
              //     width: 2,
              //     style: BorderStyle.solid,
              //   ),
              // ),
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: CachedNetworkImage(
                  placeholder: (context, url) => const BannerLoading(),
                  imageUrl:
                      'https://cdn5.f-cdn.com/contestentries/1399898/7003193/5b80a7ae8f6eb_thumb900.jpg',
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Card(
              elevation: 5,
              // shape: RoundedRectangleBorder(
              //   borderRadius: BorderRadius.circular(10),
              //   side: const BorderSide(
              //     color: Colors.white10,
              //     width: 2,
              //     style: BorderStyle.solid,
              //   ),
              // ),
              child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: CachedNetworkImage(
                    placeholder: (context, url) => const BannerLoading(),
                    imageUrl:
                        'https://www.sliderrevolution.com/wp-content/uploads/2021/09/sliderrevolution-blog-image-1.gif',
                    fit: BoxFit.fitWidth,
                  )),
            ),
          ),
        ),
      ],
      options: CarouselOptions(
        height: 250,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 7),
        autoPlayAnimationDuration: const Duration(milliseconds: 300),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        viewportFraction: 1.0,
        // enlargeFactor: 1.0,
      ),
    );
  }
}
