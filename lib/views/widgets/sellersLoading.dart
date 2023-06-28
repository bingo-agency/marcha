import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SellersLoading extends StatelessWidget {
  const SellersLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.black12,
      highlightColor: Colors.white,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: [
          sellersLoadingCard(context),
          sellersLoadingCard(context),
          sellersLoadingCard(context),
          sellersLoadingCard(context),
          sellersLoadingCard(context),
          sellersLoadingCard(context),
          sellersLoadingCard(context),
        ],
      ),
    );
  }
}

Widget sellersLoadingCard(context) {
  return Container(
    margin: const EdgeInsets.only(right: 3),
    width: 150,
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: Colors.grey[20],
      borderRadius: BorderRadius.circular(8),
    ),
    child: Stack(
      children: [
        SizedBox(
            width: 150,
            height: 350,
            child: SizedBox(
              width: 50,
              height: 10,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(4.0),
                    bottomRight: Radius.circular(4.0),
                    topLeft: Radius.circular(4.0),
                    bottomLeft: Radius.circular(4.0),
                  ),
                  color: Colors.grey[20],
                  boxShadow: const [
                    BoxShadow(
                        color: Color(0xffd4d4d9),
                        spreadRadius: 0.1,
                        blurRadius: 0.1),
                  ],
                  border: Border.all(color: Colors.black12),
                ),
              ),
            )),
        Positioned(
          right: 15,
          top: 15,
          child: Card(
            color: Colors.grey[20],
            child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: SizedBox(
                width: 70,
                height: 15,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(4.0),
                      bottomRight: Radius.circular(4.0),
                      topLeft: Radius.circular(4.0),
                      bottomLeft: Radius.circular(4.0),
                    ),
                    color: Colors.grey[20],
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 0.2,
                          blurRadius: 1.0),
                    ],
                    border: Border.all(color: Colors.black12),
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            color: Colors.white54,
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 120,
                        height: 12,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(4.0),
                              bottomRight: Radius.circular(4.0),
                              topLeft: Radius.circular(4.0),
                              bottomLeft: Radius.circular(4.0),
                            ),
                            color: Colors.grey[10],
                            boxShadow: const [
                              BoxShadow(
                                  color: Color(0xffd4d4d9),
                                  spreadRadius: 0.1,
                                  blurRadius: 0.1),
                            ],
                            border: Border.all(color: Colors.black12),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        width: 70,
                        height: 12,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(8.0),
                              bottomRight: Radius.circular(8.0),
                              topLeft: Radius.circular(8.0),
                              bottomLeft: Radius.circular(8.0),
                            ),
                            color: Colors.grey[10],
                            boxShadow: const [
                              BoxShadow(
                                  color: Color(0xffd4d4d9),
                                  spreadRadius: 0.1,
                                  blurRadius: 0.2),
                            ],
                            border: Border.all(color: Colors.black12),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: SizedBox(
                      width: 70,
                      height: 12,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(8.0),
                            bottomRight: Radius.circular(8.0),
                            topLeft: Radius.circular(8.0),
                            bottomLeft: Radius.circular(8.0),
                          ),
                          color: Colors.grey[20],
                          boxShadow: const [
                            BoxShadow(
                                color: Color(0xffd4d4d9),
                                spreadRadius: 0.1,
                                blurRadius: 0.1),
                          ],
                          border: Border.all(color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
