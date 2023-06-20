import 'package:flutter/material.dart';

import '../../helper/noRecordsFound.dart';

class MyAds extends StatelessWidget {
  const MyAds({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: noRecordsFound(context, 'No Search records saved.'),
      ),
    );
  }
}
