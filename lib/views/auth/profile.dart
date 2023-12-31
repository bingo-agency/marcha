import 'package:flutter/material.dart';

import '../../helper/noRecordsFound.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Settings'),
      ),
      body: Center(
        child: noRecordsFound(context, 'No Search records saved.'),
      ),
    );
  }
}
