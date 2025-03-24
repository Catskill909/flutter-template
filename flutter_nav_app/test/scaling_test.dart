import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_nav_app/utils/size_config.dart';

void main() {
  group('SizeConfig Tests', () {
    testWidgets('SizeConfig initializes correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) {
              SizeConfig.init(context);
              return const Scaffold();
            },
          ),
        ),
      );

      // Default test environment size is 800x600
      expect(SizeConfig.screenWidth, 800.0);
      expect(SizeConfig.screenHeight, 600.0);
      expect(SizeConfig.blockSizeHorizontal, 8.0); // 800/100
      expect(SizeConfig.blockSizeVertical, 6.0); // 600/100
    });

    testWidgets('SizeConfig scales correctly with different screen sizes',
        (WidgetTester tester) async {
      // Test mobile size
      await tester.binding.setSurfaceSize(const Size(375, 812));
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) {
              SizeConfig.init(context);
              return const Scaffold();
            },
          ),
        ),
      );

      expect(SizeConfig.screenWidth, 375.0);
      expect(SizeConfig.blockSizeHorizontal, 3.75); // 375/100
      expect(SizeConfig.spacing,
          greaterThanOrEqualTo(8.0)); // Base spacing minimum

      // Test tablet size
      await tester.binding.setSurfaceSize(const Size(768, 1024));
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) {
              SizeConfig.init(context);
              return const Scaffold();
            },
          ),
        ),
      );

      expect(SizeConfig.screenWidth, 768.0);
      expect(SizeConfig.blockSizeHorizontal, 7.68); // 768/100
      expect(SizeConfig.spacing, greaterThanOrEqualTo(8.0));

      // Test desktop size
      await tester.binding.setSurfaceSize(const Size(1440, 900));
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) {
              SizeConfig.init(context);
              return const Scaffold();
            },
          ),
        ),
      );

      expect(SizeConfig.screenWidth, 1440.0);
      expect(SizeConfig.blockSizeHorizontal, 14.4); // 1440/100
      expect(SizeConfig.spacing, greaterThanOrEqualTo(8.0));
    });

    testWidgets('Responsive extension methods work correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) {
              SizeConfig.init(context);

              // Using extension methods
              final width = 10.w;
              final height = 10.h;
              final fontSize = 16.sp;

              // Verify calculations
              expect(width, SizeConfig.blockSizeHorizontal * 10);
              expect(height, SizeConfig.blockSizeVertical * 10);
              expect(
                fontSize,
                SizeConfig.getScaledFontSize(16),
              );

              return const Scaffold();
            },
          ),
        ),
      );
    });

    testWidgets('Spacing utilities maintain proper ratios',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) {
              SizeConfig.init(context);

              // Verify spacing relationships
              expect(SizeConfig.spacingXS, equals(SizeConfig.spacing * 0.5));
              expect(SizeConfig.spacingS, equals(SizeConfig.spacing * 0.75));
              expect(SizeConfig.spacingM, equals(SizeConfig.spacing));
              expect(SizeConfig.spacingL, equals(SizeConfig.spacing * 2));
              expect(SizeConfig.spacingXL, equals(SizeConfig.spacing * 3));
              expect(SizeConfig.spacing2XL, equals(SizeConfig.spacing * 4));
              expect(SizeConfig.spacing3XL, equals(SizeConfig.spacing * 6));

              // Verify minimum spacing values
              expect(SizeConfig.spacing, greaterThanOrEqualTo(8.0));
              expect(SizeConfig.spacingXS, greaterThanOrEqualTo(4.0));
              expect(SizeConfig.spacingS, greaterThanOrEqualTo(6.0));
              expect(SizeConfig.spacingL, greaterThanOrEqualTo(16.0));

              return const Scaffold();
            },
          ),
        ),
      );
    });
  });
}
