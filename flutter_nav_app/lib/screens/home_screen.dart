import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_nav_app/utils/navigation_provider.dart';
import 'package:flutter_nav_app/widgets/custom_drawer.dart';
import 'package:flutter_nav_app/screens/explore_screen.dart';
import 'package:flutter_nav_app/screens/notifications_screen.dart';
import 'package:flutter_nav_app/screens/profile_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationProvider>(
      builder: (context, navigationProvider, child) {
        return Scaffold(
          drawer: const CustomDrawer(),
          appBar: AppBar(
            title: const Text('Flutter Navigation App'),
            backgroundColor: Theme.of(context).colorScheme.surface,
          ),
          body: IndexedStack(
            index: navigationProvider.currentIndex,
            children: [
              Center(
                child: Text(
                  'Home Content',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ),
              const ExploreScreen(),
              const NotificationsScreen(),
              const ProfileScreen(),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: navigationProvider.currentIndex,
            onTap: navigationProvider.setIndex,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Theme.of(context).colorScheme.surface,
            selectedItemColor: Theme.of(context).colorScheme.primary,
            unselectedItemColor: Theme.of(context).colorScheme.onSurface.withAlpha(153),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.explore),
                label: 'Explore',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.notifications),
                label: 'Notifications',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          ),
        );
      },
    );
  }
}
