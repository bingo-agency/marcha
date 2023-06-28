import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class MyDrawer extends StatelessWidget {
  final Animation<double> animation;
  const MyDrawer({required this.animation, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            icon: const Icon(FeatherIcons.settings),
            onPressed: () {
              print('Settings tapped.');
            },
          ),
          IconButton(
            icon: const Icon(FeatherIcons.activity),
            onPressed: () {
              print('Activity tapped.');
            },
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const CircleAvatar(
            radius: 50,
            backgroundImage: CachedNetworkImageProvider(
              'https://www.teamworkpk.com/img/avatardefault.png',
            ),
          ),
          const SizedBox(height: 20),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            onTap: () {
              // Navigate to view profile screen
            },
          ),
          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text('Edit Seller Profile'),
            onTap: () {
              // Navigate to edit profile screen
            },
          ),
          ListTile(
            leading: const Icon(Icons.list),
            title: const Text('My Ads'),
            onTap: () {
              // Navigate to view my ads screen
            },
          ),
          ListTile(
            leading: const Icon(Icons.favorite),
            title: const Text('Favourites'),
            onTap: () {
              // Navigate to view my favourites screen
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              // Navigate to logout screen
            },
          ),
        ],
      ),
    );
  }
}
