import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  final Animation<double> animation;
  const MyDrawer({required this.animation, super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width / 3,
      child: ListView(
        children: const [
          ListTile(
            title: Text('First'),
          ),
          Divider(),
          ListTile(
            title: Text('second'),
          ),
          Divider(),
          ListTile(
            title: Text('third'),
          ),
          Divider(),
          ListTile(
            title: Text('four'),
          ),
          Divider(),
          ListTile(
            title: Text('five'),
          ),
          Divider(),
          ListTile(
            title: Text('six'),
          ),
          Divider(),
          ListTile(
            title: Text('Seven'),
          ),
          Divider(),
          ListTile(
            title: Text('Logout'),
          ),
        ],
      ),
    );
  }
}
