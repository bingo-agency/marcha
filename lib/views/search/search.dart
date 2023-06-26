import 'package:flutter/material.dart';

import '../../helper/noRecordsFound.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Show searchbar'),
      ),
      body: Center(
        child: noRecordsFound(context, 'No Search records saved.'),
      ),
    );
  }
}
