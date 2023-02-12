import 'package:ds_components/ds_components.dart';
import 'package:ds_components/src/theme/ds_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DSTheme:', () {
    test('should have the expected baseTextTheme', () {
      final expectedTextTheme = TextTheme(
        displayLarge: DSTypography.secondaryRegular38,
        displayMedium: DSTypography.secondaryRegular24,
        displaySmall: DSTypography.secondaryRegular18,
        headlineLarge: DSTypography.regular32,
        bodyLarge: DSTypography.regular20,
        bodyMedium: DSTypography.regular16,
        bodySmall: DSTypography.regular15,
        titleMedium: DSTypography.regular16,
      );

      expect(DSTheme.baseTextTheme, equals(expectedTextTheme));
    });

    test('should have the expected baseTheme', () {
      final style = ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: const RoundedRectangleBorder(
            borderRadius: DSTheme.buttonBorderRadius,
          ),
          textStyle: DSTypography.regular20.copyWith(
            height: 1.2,
          ),
          minimumSize: const Size(128.0, 64.0),
          backgroundColor: Colors.transparent,
          foregroundColor: DSColors.smoothWhite,
          shadowColor: Colors.transparent,
          disabledBackgroundColor: DSColors.gray,
        ),
      );

      final expectedBaseTheme = ThemeData(
        useMaterial3: true,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: DSTypography.primaryFontFamily,
        textTheme: DSTheme.baseTextTheme,
        elevatedButtonTheme: style,
        snackBarTheme: SnackBarThemeData(
          backgroundColor: DSColors.blue,
          contentTextStyle: DSTypography.regular20.copyWith(
            color: DSColors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      );

      expect(
        DSTheme.baseTheme.copyWith(
          // Note: elevated button theme is tested separately as it requires
          // reference equality.
          elevatedButtonTheme: style,
        ),
        equals(expectedBaseTheme),
      );

      // Note: I'd have similar tests for the light and dark themes.
    });

    test('should have the expected elevated button style on baseTheme', () {
      final expectedStyle = ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: const RoundedRectangleBorder(
            borderRadius: DSTheme.buttonBorderRadius,
          ),
          textStyle: DSTypography.regular20.copyWith(
            height: 1.2,
          ),
          minimumSize: const Size(128.0, 64.0),
          backgroundColor: Colors.transparent,
          foregroundColor: DSColors.smoothWhite,
          shadowColor: Colors.transparent,
          disabledBackgroundColor: DSColors.gray,
        ),
      ).style;

      final actualStyle = DSTheme.baseTheme.elevatedButtonTheme.style;

      expect(
        actualStyle?.shape?.resolve({MaterialState.focused}),
        equals(expectedStyle?.shape?.resolve({MaterialState.focused})),
      );
      // Note: Here I'd test all the other states.
    });

    test('should have the expected static properties', () {
      const buttonBorderRadius = BorderRadius.all(
        Radius.circular(16.0),
      );
      expect(
        DSTheme.buttonBorderRadius,
        equals(buttonBorderRadius),
      );
      const bottomSheetBorderRadius = BorderRadius.all(
        Radius.circular(16.0),
      );
      expect(
        DSTheme.bottomSheetBorderRadius,
        equals(bottomSheetBorderRadius),
      );
      const defaultPageMargin = EdgeInsets.symmetric(horizontal: 24.0);
      expect(
        DSTheme.defaultPageMargin,
        equals(defaultPageMargin),
      );
      const iconSplashRadius = 24.0;
      expect(
        DSTheme.iconSplashRadius,
        equals(iconSplashRadius),
      );

      const inputFieldHeight = 80.0;
      expect(
        DSTheme.inputFieldHeight,
        equals(inputFieldHeight),
      );
      const defaultAppBarHeight = 72.0;
      expect(
        DSTheme.defaultAppBarHeight,
        equals(defaultAppBarHeight),
      );
      const defaultAppBarBorderRadius = BorderRadius.vertical(
        bottom: Radius.circular(24.0),
      );
      expect(
        DSTheme.defaultAppBarBorderRadius,
        equals(defaultAppBarBorderRadius),
      );
    });
  });
}
