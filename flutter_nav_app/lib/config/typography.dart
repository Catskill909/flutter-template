import 'package:flutter/material.dart';
import '../utils/size_config.dart';

/// App typography configuration that provides scalable text styles
class AppTypography {
  /// Get the app's text theme that scales with screen size
  static TextTheme get textTheme {
    return TextTheme(
      // Display styles
      displayLarge: TextStyle(
        fontSize: 57.sp,
        height: 1.12,
        letterSpacing: -0.25,
        fontWeight: FontWeight.w400,
      ),
      displayMedium: TextStyle(
        fontSize: 45.sp,
        height: 1.15,
        letterSpacing: 0,
        fontWeight: FontWeight.w400,
      ),
      displaySmall: TextStyle(
        fontSize: 36.sp,
        height: 1.22,
        letterSpacing: 0,
        fontWeight: FontWeight.w400,
      ),

      // Headline styles
      headlineLarge: TextStyle(
        fontSize: 32.sp,
        height: 1.25,
        letterSpacing: -0.2,
        fontWeight: FontWeight.w500,
      ),
      headlineMedium: TextStyle(
        fontSize: 28.sp,
        height: 1.29,
        letterSpacing: -0.15,
        fontWeight: FontWeight.w500,
      ),
      headlineSmall: TextStyle(
        fontSize: 24.sp,
        height: 1.33,
        letterSpacing: 0,
        fontWeight: FontWeight.w500,
      ),

      // Title styles
      titleLarge: TextStyle(
        fontSize: 22.sp,
        height: 1.27,
        letterSpacing: 0,
        fontWeight: FontWeight.w600,
      ),
      titleMedium: TextStyle(
        fontSize: 16.sp,
        height: 1.5,
        letterSpacing: 0.1,
        fontWeight: FontWeight.w600,
      ),
      titleSmall: TextStyle(
        fontSize: 14.sp,
        height: 1.43,
        letterSpacing: 0.1,
        fontWeight: FontWeight.w600,
      ),

      // Body styles
      bodyLarge: TextStyle(
        fontSize: 16.sp,
        height: 1.5,
        letterSpacing: 0.5,
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: TextStyle(
        fontSize: 14.sp,
        height: 1.43,
        letterSpacing: 0.25,
        fontWeight: FontWeight.w400,
      ),
      bodySmall: TextStyle(
        fontSize: 12.sp,
        height: 1.33,
        letterSpacing: 0.4,
        fontWeight: FontWeight.w400,
      ),

      // Label styles
      labelLarge: TextStyle(
        fontSize: 14.sp,
        height: 1.43,
        letterSpacing: 0.1,
        fontWeight: FontWeight.w600,
      ),
      labelMedium: TextStyle(
        fontSize: 12.sp,
        height: 1.33,
        letterSpacing: 0.5,
        fontWeight: FontWeight.w600,
      ),
      labelSmall: TextStyle(
        fontSize: 11.sp,
        height: 1.45,
        letterSpacing: 0.5,
        fontWeight: FontWeight.w600,
      ),
    ).apply(
      fontFamily: 'Roboto',
      displayColor: Colors.black87,
      bodyColor: Colors.black87,
    );
  }

  /// Get scaled text style for specific use cases
  static TextStyle get appBarTitle => TextStyle(
        fontSize: 20.sp,
        height: 1.4,
        letterSpacing: 0.15,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get drawerItemTitle => TextStyle(
        fontSize: 16.sp,
        height: 1.5,
        letterSpacing: 0.15,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get buttonText => TextStyle(
        fontSize: 14.sp,
        height: 1.43,
        letterSpacing: 0.1,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get caption => TextStyle(
        fontSize: 12.sp,
        height: 1.33,
        letterSpacing: 0.4,
        fontWeight: FontWeight.w400,
      );
}
