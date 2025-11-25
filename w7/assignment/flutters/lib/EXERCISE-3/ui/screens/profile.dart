import 'package:flutter/material.dart';
import 'package:flutters/EXERCISE-3/model/profile_tile_model.dart';

import '../theme/theme.dart';

class ProfileApp extends StatelessWidget {
  final ProfileData profileData; 
  // const ProfileApp({super.key});
  const ProfileApp({super.key, required this.profileData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary.withAlpha(100),
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text(
          'CADT student Profile',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          const SizedBox(height: 40),
          const Center(
            child: CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage(
                'lib/EXERCISE-3/assets/images/aang.png'), 
            // backgroundColor: Colors.transparent,
          ),
          ),
          const SizedBox(height: 20),
          Center(
            child: Text(
              // 'Ronan OGOR',
              // ronanProfile.name,
              profileData.name,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
          ),
          Center(
            child: Text(
              // 'Flutter Developer',
              profileData.position,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ),
          for (var tile in profileData.tiles)
            ProfileTile(
              icon: tile.icon,
              title: tile.title,
              data: tile.value,
            )
        ],
      ),
    );
  }
}

class ProfileTile extends StatelessWidget {
  const ProfileTile({
    super.key,
    required this.icon,
    required this.title,
    required this.data,
  });

  final IconData icon;
  final String title;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: ListTile(
          leading: Icon(icon, color: AppColors.primary),
          title: Text(title),
          subtitle: Text(data),
        ),
      ),
    );
  }
}