import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utils/navigation_provider.dart';
import '../screens/webview_screen.dart';
import '../models/navigation/menu_item.dart';

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

    if (navigationProvider.isLoading) {
      return const Drawer(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    final config = navigationProvider.config;
    if (config == null) {
      return const Drawer(
        child: Center(
          child: Text('Error loading navigation configuration'),
        ),
      );
    }

    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Color(int.parse(config.drawer.header.backgroundColor
                  .replaceAll('#', '0xFF'))),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Color(0xFF2A3441),
                  child: Icon(
                    _getIconData(config.drawer.header.icon),
                    size: 40,
                    color: Color(0xFF64B5F6),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  config.drawer.header.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          ...config.drawer.sections.expand((section) {
            final items = <Widget>[];

            // Add section header if there's more than one section
            if (config.drawer.sections.length > 1) {
              items.add(
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
                  child: Text(
                    section.name,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: Colors.white70,
                        ),
                  ),
                ),
              );
            }

            // Add menu items
            items.addAll(
              section.items.map((item) => _buildMenuItem(
                    context,
                    item,
                    navigationProvider,
                  )),
            );

            // Add divider after each section except the last one
            if (section != config.drawer.sections.last) {
              items.add(const Divider(height: 16));
            }

            return items;
          }),
          if (navigationProvider.error != null)
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                'Warning: ${navigationProvider.error!.message}',
                style: TextStyle(
                  color: Colors.orange[300],
                  fontSize: 12,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(
    BuildContext context,
    MenuItem item,
    NavigationProvider navigationProvider,
  ) {
    final isInternal = item.type == MenuItemType.internal;
    final isSelected =
        isInternal && navigationProvider.currentIndex == item.route;

    return ListTile(
      selected: isSelected,
      selectedTileColor: const Color(0xFF2A3441),
      leading: Icon(
        _getIconData(item.icon),
        color: isSelected ? const Color(0xFF64B5F6) : Colors.white70,
      ),
      title: Text(item.title, style: const TextStyle(color: Colors.white)),
      onTap: () {
        if (isInternal) {
          navigationProvider.setIndex(item.route!);
          Navigator.pop(context);
        } else if (item.url != null) {
          _openWebView(context, item.url!, item.title);
        }
      },
    );
  }

  IconData _getIconData(String iconName) {
    // Add more icon mappings as needed
    final iconMap = {
      'home': Icons.home,
      'explore': Icons.explore,
      'notifications': Icons.notifications,
      'person': Icons.person,
      'menu': Icons.menu,
      'music_note': Icons.music_note,
      'web': Icons.web,
      'live_tv': Icons.live_tv,
      'stream': Icons.stream,
      'error': Icons.error,
    };

    return iconMap[iconName] ?? Icons.error;
  }
}
