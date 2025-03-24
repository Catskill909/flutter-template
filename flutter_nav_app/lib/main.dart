import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'utils/navigation_provider.dart';
import 'utils/size_config.dart';
import 'config/theme.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NavigationProvider(),
      child: ResponsiveApp(
        child: Builder(builder: (context) {
          return MaterialApp(
            title: 'Flutter Navigation App',
            theme: AppTheme.getTheme(context, false),
            darkTheme: AppTheme.getTheme(context, true),
            themeMode: ThemeMode.dark,
            home: const HomeScreen(),
          );
        }),
      ),
    );
  }
}

/// Wrapper widget that handles responsive sizing initialization
class ResponsiveApp extends StatelessWidget {
  final Widget child;

  const ResponsiveApp({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig.init(context);
            return child;
          },
        );
      },
    );
  }
}
