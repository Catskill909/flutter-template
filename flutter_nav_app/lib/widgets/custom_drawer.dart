import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utils/navigation_provider.dart';
import '../screens/webview_screen.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  void _openWebView(BuildContext context, String url, String title) {
    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WebViewScreen(url: url),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xFF1E2530),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Color(0xFF2A3441),
                  child: Icon(
                    Icons.person,
                    size: 40,
                    color: Color(0xFF64B5F6),
                  ),
                ),
                const SizedBox(height: 10),
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
            selectedTileColor: Color(0xFF2A3441),
            leading: Icon(Icons.home, color: navigationProvider.currentIndex == 0 ? Color(0xFF64B5F6) : Colors.white70),
            title: Text('Home', style: TextStyle(color: Colors.white)),
            onTap: () {
              navigationProvider.setIndex(0);
              Navigator.pop(context);
            },
          ),
          ListTile(
            selected: navigationProvider.currentIndex == 1,
            selectedTileColor: Color(0xFF2A3441),
            leading: Icon(Icons.explore, color: navigationProvider.currentIndex == 1 ? Color(0xFF64B5F6) : Colors.white70),
            title: Text('Explore', style: TextStyle(color: Colors.white)),
            onTap: () {
              navigationProvider.setIndex(1);
              Navigator.pop(context);
            },
          ),
          ListTile(
            selected: navigationProvider.currentIndex == 2,
            selectedTileColor: Color(0xFF2A3441),
            leading: Icon(Icons.notifications, color: navigationProvider.currentIndex == 2 ? Color(0xFF64B5F6) : Colors.white70),
            title: Text('Notifications', style: TextStyle(color: Colors.white)),
            onTap: () {
              navigationProvider.setIndex(2);
              Navigator.pop(context);
            },
          ),
          ListTile(
            selected: navigationProvider.currentIndex == 3,
            selectedTileColor: Color(0xFF2A3441),
            leading: Icon(Icons.person, color: navigationProvider.currentIndex == 3 ? Color(0xFF64B5F6) : Colors.white70),
            title: Text('Profile', style: TextStyle(color: Colors.white)),
            onTap: () {
              navigationProvider.setIndex(3);
              Navigator.pop(context);
            },
          ),
          const Divider(),
          ListTile(
            leading: Icon(Icons.music_note, color: Colors.white70),
            title: Text('Old Skool Sessions', style: TextStyle(color: Colors.white)),
            onTap: () => _openWebView(
              context,
              'https://oldskoolsessions.com',
              'Old Skool Sessions',
            ),
          ),
          ListTile(
            leading: Icon(Icons.web, color: Colors.white70),
            title: Text('Starkey Website', style: TextStyle(color: Colors.white)),
            onTap: () => _openWebView(
              context,
              'https://starkey.website',
              'Starkey Website',
            ),
          ),
          ListTile(
            leading: Icon(Icons.live_tv, color: Colors.white70),
            title: Text('SuperSoul Live', style: TextStyle(color: Colors.white)),
            onTap: () => _openWebView(
              context,
              'https://supersoul.live',
              'SuperSoul Live',
            ),
          ),
          ListTile(
            leading: Icon(Icons.stream, color: Colors.white70),
            title: Text('SuperSoul Stream', style: TextStyle(color: Colors.white)),
            onTap: () => _openWebView(
              context,
              'https://supersoul.stream',
              'SuperSoul Stream',
            ),
          ),
        ],
      ),
    );
  }
}
