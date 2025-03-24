import 'package:flutter/material.dart';

/// Configuration class for managing responsive sizing throughout the app.
///
/// This class provides utility methods and properties for responsive sizing based on
/// screen dimensions. It must be initialized in the root widget using [init].
class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double blockSizeHorizontal;
  static late double blockSizeVertical;

  // Base sizes for different device categories
  static const double mobileBaseWidth = 375.0;
  static const double tabletBaseWidth = 768.0;
  static const double desktopBaseWidth = 1440.0;

  // Default spacing units
  static late double spacing; // Base unit (8.0)
  static late double spacingXS; // 4.0
  static late double spacingS; // 6.0
  static late double spacingM; // 8.0
  static late double spacingL; // 16.0
  static late double spacingXL; // 24.0
  static late double spacing2XL; // 32.0
  static late double spacing3XL; // 48.0

  /// Initialize the configuration using BuildContext
  static void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;

    // Initialize spacing based on screen size
    _initializeSpacing();
  }

  /// Initialize spacing values based on screen width
  static void _initializeSpacing() {
    // Base spacing unit is 2% of screen width, with minimum of 8.0
    spacing = blockSizeHorizontal * 2;
    if (spacing < 8.0) spacing = 8.0;

    // Define other spacing values based on base spacing
    spacingXS = spacing * 0.5; // 4.0 at minimum
    spacingS = spacing * 0.75; // 6.0 at minimum
    spacingM = spacing; // 8.0 at minimum
    spacingL = spacing * 2; // 16.0 at minimum
    spacingXL = spacing * 3; // 24.0 at minimum
    spacing2XL = spacing * 4; // 32.0 at minimum
    spacing3XL = spacing * 6; // 48.0 at minimum
  }

  /// Get a size that scales with screen width
  static double getScaledWidth(double size) {
    double baseWidth = mobileBaseWidth;
    if (screenWidth >= desktopBaseWidth) {
      baseWidth = desktopBaseWidth;
    } else if (screenWidth >= tabletBaseWidth) {
      baseWidth = tabletBaseWidth;
    }
    return (screenWidth / baseWidth) * size;
  }

  /// Get font size that scales with screen width
  static double getScaledFontSize(double size) {
    double scaledSize = getScaledWidth(size);
    // Limit minimum font size
    if (scaledSize < size * 0.8) {
      scaledSize = size * 0.8;
    }
    // Limit maximum font size
    if (scaledSize > size * 1.2) {
      scaledSize = size * 1.2;
    }
    return scaledSize;
  }

  /// Get horizontal padding that scales with screen width
  static double get screenPadding {
    if (screenWidth >= desktopBaseWidth) {
      return blockSizeHorizontal * 8; // 8% of screen width
    } else if (screenWidth >= tabletBaseWidth) {
      return blockSizeHorizontal * 6; // 6% of screen width
    }
    return blockSizeHorizontal * 4; // 4% of screen width
  }
}

/// Extension methods for easy size conversion
extension ResponsiveSize on num {
  /// Get size relative to screen width
  double get w => SizeConfig.blockSizeHorizontal * this;

  /// Get size relative to screen height
  double get h => SizeConfig.blockSizeVertical * this;

  /// Get scaled font size
  double get sp => SizeConfig.getScaledFontSize(toDouble());

  /// Get scaled width
  double get sw => SizeConfig.getScaledWidth(toDouble());
}
