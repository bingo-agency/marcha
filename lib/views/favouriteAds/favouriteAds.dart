import 'package:flutter/material.dart';

import '../../helper/noRecordsFound.dart';

class FavouriteAds extends StatelessWidget {
  const FavouriteAds({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favourite Ads'),
      ),
      body: Center(
        child: noRecordsFound(context, 'No Search records saved.'),
      ),
    );
  }
}
