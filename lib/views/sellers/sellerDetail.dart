import 'package:flutter/material.dart';

class SellerDetail extends StatelessWidget {
  final String id;
  const SellerDetail({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text('Seller Details.')),
    );
  }
}
