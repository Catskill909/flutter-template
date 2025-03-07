import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_nav_app/utils/navigation_provider.dart';
import 'package:flutter_nav_app/config/theme.dart';
import 'package:flutter_nav_app/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NavigationProvider(),
      child: MaterialApp(
        title: 'Flutter Navigation App',
        theme: AppTheme.darkTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.dark,
        home: const HomeScreen(),
      ),
    );
  }
}
