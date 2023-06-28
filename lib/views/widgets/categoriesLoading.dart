import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CategoriesLoading extends StatelessWidget {
  const CategoriesLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.black12,
      highlightColor: Colors.white,
      child: ListView.builder(
        itemCount: 20,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(154, 98, 89, 89),
                      blurRadius: 5,
                      offset: Offset(0.0, 0.0),
                    ),
                  ],
                  color: Colors.grey[100],
                  borderRadius:
                      const BorderRadius.only(topRight: Radius.circular(25.0)),
                ),
                margin:
                    const EdgeInsets.only(right: 15.0, top: 2.0, bottom: 2.0),
                width: 100,
                height: 100,
              ),
              // Container(
              //   color: Colors.grey,
              //   width: 100,
              //   height: 100,
              // ),
            ],
          );
        },
      ),
    );
  }
}
