import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utils/navigation_provider.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, size: 40, color: Colors.blue),
                ),
                SizedBox(height: 10),
                Text(
                  'Navigation Menu',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            selected: navigationProvider.currentIndex == 0,
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              navigationProvider.setIndex(0);
              Navigator.pop(context);
            },
          ),
          ListTile(
            selected: navigationProvider.currentIndex == 1,
            leading: const Icon(Icons.explore),
            title: const Text('Explore'),
            onTap: () {
              navigationProvider.setIndex(1);
              Navigator.pop(context);
            },
          ),
          ListTile(
            selected: navigationProvider.currentIndex == 2,
            leading: const Icon(Icons.notifications),
            title: const Text('Notifications'),
            onTap: () {
              navigationProvider.setIndex(2);
              Navigator.pop(context);
            },
          ),
          ListTile(
            selected: navigationProvider.currentIndex == 3,
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            onTap: () {
              navigationProvider.setIndex(3);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
