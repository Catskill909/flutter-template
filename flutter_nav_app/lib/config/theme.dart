import 'package:flutter/material.dart';
import '../utils/size_config.dart';
import 'typography.dart';

class AppTheme {
  static ThemeData getTheme(BuildContext context, bool isDark) {
    // Ensure SizeConfig is initialized
    SizeConfig.init(context);

    if (isDark) {
      return _getDarkTheme(context);
    }
    return _getLightTheme(context);
  }

  // Get size based on device type
  static double _getAdaptiveSize(
    BuildContext context, {
    required double mobile,
    required double tablet,
    double? desktop,
  }) {
    if (isDesktop(context)) {
      return (desktop ?? tablet).w;
    } else if (isTablet(context)) {
      return tablet.w;
    }
    return mobile.w;
  }

  // Get font size based on device type
  static double _getAdaptiveFontSize(
    BuildContext context, {
    required double mobile,
    required double tablet,
    double? desktop,
  }) {
    if (isDesktop(context)) {
      return (desktop ?? tablet).sp;
    } else if (isTablet(context)) {
      return tablet.sp;
    }
    return mobile.sp;
  }

  static ThemeData _getLightTheme(BuildContext context) {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: Colors.white,
      primaryColor: Colors.blue,
      colorScheme: const ColorScheme.light(
        primary: Colors.blue,
        secondary: Colors.blueAccent,
        surface: Colors.white,
      ),
      textTheme: AppTypography.textTheme,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        centerTitle: true,
        elevation: 0,
        titleTextStyle: AppTypography.appBarTitle.copyWith(
          fontSize: _getAdaptiveFontSize(
            context,
            mobile: 20,
            tablet: 28,
            desktop: 32,
          ),
        ),
        toolbarHeight: _getAdaptiveSize(
          context,
          mobile: 8,
          tablet: 12,
          desktop: 10,
        ),
        toolbarTextStyle: AppTypography.textTheme.bodyMedium,
        iconTheme: IconThemeData(
          size: _getAdaptiveSize(
            context,
            mobile: 24,
            tablet: 32,
            desktop: 28,
          ),
        ),
      ),
      drawerTheme: DrawerThemeData(
        backgroundColor: Colors.white,
        width: getDrawerWidth(context),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(2.w),
            bottomRight: Radius.circular(2.w),
          ),
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        elevation: 8,
        selectedLabelStyle: AppTypography.caption.copyWith(
          fontSize: _getAdaptiveFontSize(
            context,
            mobile: 12,
            tablet: 16,
          ),
        ),
        unselectedLabelStyle: AppTypography.caption.copyWith(
          fontSize: _getAdaptiveFontSize(
            context,
            mobile: 12,
            tablet: 16,
          ),
        ),
        type: BottomNavigationBarType.fixed,
        landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
      ),
      cardTheme: CardTheme(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2.w),
        ),
        margin: EdgeInsets.all(SizeConfig.spacingS),
      ),
      listTileTheme: ListTileThemeData(
        contentPadding: EdgeInsets.symmetric(
          horizontal: SizeConfig.spacingM,
          vertical: SizeConfig.spacingXS,
        ),
        minLeadingWidth: 6.w,
        iconColor: Colors.blue,
        textColor: Colors.grey.withValues(alpha: 204),
      ),
      dividerTheme: DividerThemeData(
        space: SizeConfig.spacingM,
        thickness: 1,
        color: Colors.grey.withValues(alpha: 51),
      ),
    );
  }

  static ThemeData _getDarkTheme(BuildContext context) {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: const Color(0xFF121212),
      primaryColor: Colors.blue,
      colorScheme: const ColorScheme.dark(
        primary: Colors.blue,
        secondary: Colors.blueAccent,
        surface: Color(0xFF121212),
      ),
      textTheme: AppTypography.textTheme.apply(
        bodyColor: Colors.white,
        displayColor: Colors.white,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: const Color(0xFF1E1E1E),
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        titleTextStyle: AppTypography.appBarTitle.copyWith(
          color: Colors.white,
          fontSize: _getAdaptiveFontSize(
            context,
            mobile: 20,
            tablet: 28,
            desktop: 32,
          ),
        ),
        toolbarHeight: _getAdaptiveSize(
          context,
          mobile: 8,
          tablet: 12,
          desktop: 10,
        ),
        toolbarTextStyle: AppTypography.textTheme.bodyMedium?.copyWith(
          color: Colors.white,
        ),
        iconTheme: IconThemeData(
          size: _getAdaptiveSize(
            context,
            mobile: 24,
            tablet: 32,
            desktop: 28,
          ),
        ),
      ),
      drawerTheme: DrawerThemeData(
        backgroundColor: const Color(0xFF1E1E1E),
        width: getDrawerWidth(context),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(2.w),
            bottomRight: Radius.circular(2.w),
          ),
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: const Color(0xFF1E1E1E),
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        elevation: 8,
        selectedLabelStyle: AppTypography.caption.copyWith(
          color: Colors.white,
          fontSize: _getAdaptiveFontSize(
            context,
            mobile: 12,
            tablet: 16,
          ),
        ),
        unselectedLabelStyle: AppTypography.caption.copyWith(
          color: Colors.grey,
          fontSize: _getAdaptiveFontSize(
            context,
            mobile: 12,
            tablet: 16,
          ),
        ),
        type: BottomNavigationBarType.fixed,
        landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
      ),
      cardTheme: CardTheme(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2.w),
        ),
        margin: EdgeInsets.all(SizeConfig.spacingS),
        color: const Color(0xFF1E1E1E),
      ),
      listTileTheme: ListTileThemeData(
        contentPadding: EdgeInsets.symmetric(
          horizontal: SizeConfig.spacingM,
          vertical: SizeConfig.spacingXS,
        ),
        minLeadingWidth: 6.w,
        iconColor: Colors.blue,
        textColor: Colors.white.withValues(alpha: 204),
      ),
      dividerTheme: DividerThemeData(
        space: SizeConfig.spacingM,
        thickness: 1,
        color: Colors.grey.withValues(alpha: 51),
      ),
    );
  }

  // Screen-specific background colors
  static const Map<int, Color> screenColors = {
    0: Color(0xFF121212), // Home
    1: Color(0xFF1A1A2E), // Explore
    2: Color(0xFF1A1F3C), // Notifications
    3: Color(0xFF1E1E2E), // Profile
  };

  // Breakpoint utilities
  static bool isTablet(BuildContext context) {
    return MediaQuery.of(context).size.width >= 600;
  }

  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= 1024;
  }

  static double getDrawerWidth(BuildContext context) {
    if (isDesktop(context)) {
      return 25.w; // 25% of screen width on desktop
    } else if (isTablet(context)) {
      return 40.w; // 40% of screen width on tablet
    }
    return 85.w; // 85% of screen width on mobile
  }

  static EdgeInsets getScreenPadding(BuildContext context) {
    return EdgeInsets.symmetric(
      horizontal: SizeConfig.screenPadding,
      vertical: SizeConfig.spacingM,
    );
  }
}
