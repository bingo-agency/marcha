import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BannerLoading extends StatelessWidget {
  const BannerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.black12,
      highlightColor: Colors.white,
      child: const SizedBox(
        height: 250,
        width: double.infinity,
      ),
    );
  }
}
