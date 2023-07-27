import 'package:flutter/material.dart';
import 'package:marcha/views/home/widgets/customAppBar.dart';

import '../../helper/noRecordsFound.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: customAppBar(context),
      ),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [noRecordsFound(context, 'No Search records saved.')],
        ),
      ),
    );
  }
}
