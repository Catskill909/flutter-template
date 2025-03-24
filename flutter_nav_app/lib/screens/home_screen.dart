import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utils/navigation_provider.dart';
import '../utils/size_config.dart';
import '../config/typography.dart';
import '../config/theme.dart';
import '../widgets/custom_drawer.dart';
import 'explore_screen.dart';
import 'notifications_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isTablet = AppTheme.isTablet(context);

    return Consumer<NavigationProvider>(
      builder: (context, navigationProvider, child) {
        return Scaffold(
          drawer: const CustomDrawer(),
          appBar: AppBar(
            leading: Builder(
              builder: (context) => IconButton(
                icon: Icon(
                  Icons.menu,
                  size: isTablet ? 32 : 24,
                ),
                onPressed: () => Scaffold.of(context).openDrawer(),
                padding: EdgeInsets.all(isTablet ? 12 : 8),
              ),
            ),
            title: Text(
              'Flutter Navigation App',
              style: TextStyle(
                fontSize: isTablet ? 28.sp : 20.sp,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            backgroundColor: Theme.of(context).colorScheme.surface,
            toolbarHeight: isTablet ? 12.h : 8.h,
          ),
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.screenPadding,
                vertical: SizeConfig.spacingM,
              ),
              child: IndexedStack(
                index: navigationProvider.currentIndex,
                children: [
                  _buildHomeContent(context),
                  const ExploreScreen(),
                  const NotificationsScreen(),
                  const ProfileScreen(),
                ],
              ),
            ),
          ),
          bottomNavigationBar:
              _buildBottomNavigationBar(context, navigationProvider),
        );
      },
    );
  }

  Widget _buildHomeContent(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Use different layouts based on available width
        if (constraints.maxWidth >= 768) {
          return _buildWideLayout(context);
        }
        return _buildNarrowLayout(context);
      },
    );
  }

  Widget _buildNarrowLayout(BuildContext context) {
    final isTablet = AppTheme.isTablet(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.home,
            size: isTablet ? 16.w : 12.w, // Larger on tablet
            color: Theme.of(context).colorScheme.primary,
          ),
          SizedBox(height: SizeConfig.spacingL),
          Text(
            'Welcome Home',
            style: AppTypography.textTheme.headlineMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
              fontSize: isTablet ? 36.sp : 28.sp, // Larger on tablet
            ),
          ),
          SizedBox(height: SizeConfig.spacingM),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal:
                  isTablet ? SizeConfig.spacing2XL : SizeConfig.spacingL,
            ),
            child: Text(
              'Explore our app using the navigation menu or bottom bar',
              style: AppTypography.textTheme.bodyLarge?.copyWith(
                color: Theme.of(context)
                    .colorScheme
                    .onSurface
                    .withValues(alpha: 204),
                fontSize: isTablet ? 18.sp : 16.sp, // Larger on tablet
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWideLayout(BuildContext context) {
    final isTablet = AppTheme.isTablet(context);

    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(SizeConfig.spacingL),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome Home',
                  style: AppTypography.textTheme.displaySmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontSize: isTablet ? 48.sp : 36.sp, // Larger on tablet
                  ),
                ),
                SizedBox(height: SizeConfig.spacingM),
                Text(
                  'Explore our app using the navigation menu or bottom bar',
                  style: AppTypography.textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withValues(alpha: 204),
                    fontSize: isTablet ? 20.sp : 16.sp, // Larger on tablet
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: SizeConfig.spacingL),
        Expanded(
          child: Center(
            child: Icon(
              Icons.home,
              size: isTablet ? 25.w : 20.w, // Larger on tablet
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBottomNavigationBar(
      BuildContext context, NavigationProvider navigationProvider) {
    final isTablet = AppTheme.isTablet(context);
    final iconSize = isTablet ? 8.w : 6.w; // Larger icons on tablet

    return BottomNavigationBar(
      currentIndex: navigationProvider.currentIndex,
      onTap: navigationProvider.setIndex,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Theme.of(context).colorScheme.surface,
      selectedItemColor: Theme.of(context).colorScheme.primary,
      unselectedItemColor:
          Theme.of(context).colorScheme.onSurface.withValues(alpha: 153),
      selectedLabelStyle: AppTypography.caption.copyWith(
        fontSize: isTablet ? 14.sp : 12.sp, // Larger text on tablet
        fontWeight: FontWeight.w600,
      ),
      unselectedLabelStyle: AppTypography.caption.copyWith(
        fontSize: isTablet ? 14.sp : 12.sp, // Larger text on tablet
      ),
      iconSize: iconSize,
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
    );
  }
}
