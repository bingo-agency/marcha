import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../listing/listing.dart';

class City extends StatelessWidget {
  const City({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String curl = "?*";
    // var size = MediaQuery.of(context).size;
    // var height = size.height;
    // var width = size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Popular Cities',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: () {
                    print('List of all cities.');
                  },
                  child: Text(
                    'View All',
                    style: TextStyle(
                        color: Theme.of(context).disabledColor,
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Flexible(
                flex: 3,
                child: GestureDetector(
                  onTap: () {
                    curl = "?city_search=islamabad";
                    // print(curl);
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) =>
                            Listing(curl: curl)));
                  },
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: CachedNetworkImage(
                            // width: width / 3,
                            // height: 200,
                            fit: BoxFit.cover,
                            imageUrl:
                                'https://teamworkpk.com/img/blog/islamabad.jpeg',
                          ),
                        ),
                        Container(
                          color: Colors.black12,
                        ),
                        const Positioned(
                          bottom: 0,
                          left: 0,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Islamabad",
                              style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 3,
                child: GestureDetector(
                  onTap: () {
                    curl = "?city_search=lahore";
                    // print(curl);
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) =>
                            Listing(curl: curl)));
                  },
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl:
                                'https://teamworkpk.com/img/blog/lahore.jpeg',
                          ),
                        ),
                        Container(
                          color: Colors.black12,
                        ),
                        const Positioned(
                          bottom: 0,
                          left: 0,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Lahore",
                              style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 3,
                child: GestureDetector(
                  onTap: () {
                    curl = "?city_search=peshawar";
                    // print(curl);
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) =>
                            Listing(curl: curl)));
                  },
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl:
                                'https://teamworkpk.com/img/blog/peshawar.jpeg',
                          ),
                        ),
                        Container(
                          color: Colors.black12,
                        ),
                        const Positioned(
                          bottom: 0,
                          left: 0,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Peshawar",
                              style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          Row(
            children: [
              Flexible(
                flex: 3,
                child: GestureDetector(
                  onTap: () {
                    curl = "?city_search=abbotabad";
                    // print(curl);
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) =>
                            Listing(curl: curl)));
                  },
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl:
                                'https://teamworkpk.com/img/blog/abbotabad.jpeg',
                          ),
                        ),
                        Container(
                          color: Colors.black12,
                        ),
                        const Positioned(
                          bottom: 0,
                          left: 0,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Abbotabad",
                              style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 7,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      curl = "?city_search=karachi";
                      // print(curl);
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) =>
                              Listing(curl: curl)));
                    },
                    child: Card(
                      clipBehavior: Clip.antiAlias,
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: CachedNetworkImage(
                              fit: BoxFit.cover,
                              imageUrl:
                                  'https://teamworkpk.com/img/blog/karachi.png',
                            ),
                          ),
                          Container(
                            color: Colors.black12,
                          ),
                          const Positioned(
                            bottom: 0,
                            left: 0,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "Karachi",
                                style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
