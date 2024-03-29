import 'package:flutter/material.dart';

import 'ds_colors.dart';
import 'ds_typography.dart';

class DSTheme {
  DSTheme._({
    required this.data,
  });

  /// Creates a [DSTheme] configured with a light [ThemeData].
  DSTheme.light()
      : this._(
          data: baseTheme.copyWith(
            brightness: Brightness.light,
            scaffoldBackgroundColor: DSColors.smoothWhite,
            canvasColor: DSColors.white,
            dividerColor: DSColors.paleGrey,
            disabledColor: DSColors.paleGrey,
            progressIndicatorTheme: const ProgressIndicatorThemeData(
              color: DSColors.blue,
            ),
            textSelectionTheme: const TextSelectionThemeData(
              cursorColor: DSColors.gray, //thereby
            ),
            dialogBackgroundColor: DSColors.white,
            colorScheme: baseTheme.colorScheme.copyWith(
              primary: DSColors.darkBlue,
              onPrimary: DSColors.smoothWhite,
              onSurface: DSColors.smoothBlack,
              secondary: DSColors.gray,
              secondaryContainer: DSColors.white,
              onSecondaryContainer: DSColors.lightGrey,
              tertiaryContainer: DSColors.spaceBlack,
              onTertiaryContainer: DSColors.smoothWhite,
            ),
            appBarTheme: AppBarTheme(
              backgroundColor: DSColors.white,
              surfaceTintColor: DSColors.transparent,
              titleTextStyle: DSTypography.regular20.copyWith(
                color: DSColors.spaceBlack,
              ),
              foregroundColor:
                  MaterialStateColor.resolveWith((Set<MaterialState> states) {
                return states.contains(MaterialState.scrolledUnder)
                    ? DSColors.spaceBlack
                    : DSColors.white;
              }),
              shadowColor: DSColors.appBarShadow,
              iconTheme: const IconThemeData(
                size: 26.0,
                color: DSColors.spaceBlack,
              ),
              actionsIconTheme: const IconThemeData(
                size: 26.0,
                color: DSColors.titaniumGray,
              ),
            ),
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              selectedIconTheme: IconThemeData(
                color: DSColors.spaceBlack,
                size: 24.0,
              ),
              unselectedIconTheme: IconThemeData(
                color: DSColors.titaniumGray,
                size: 24.0,
              ),
            ),
            bottomSheetTheme: const BottomSheetThemeData(
              backgroundColor: DSColors.smoothWhite,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: DSColors.darkBlue,
                textStyle: DSTypography.regular15,
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 2.0,
                ),
                minimumSize: const Size(56.0, 24.0),
              ),
            ),
            outlinedButtonTheme: OutlinedButtonThemeData(
              style: OutlinedButton.styleFrom(
                backgroundColor: DSColors.white,
                shape: const RoundedRectangleBorder(
                  borderRadius: buttonBorderRadius,
                ),
                side: BorderSide(color: DSColors.lightGrey),
                foregroundColor: DSColors.blue,
                textStyle: DSTypography.regular20,
                minimumSize: const Size(128.0, 64.0),
                shadowColor: Colors.transparent,
              ),
            ),
            inputDecorationTheme: InputDecorationTheme(
              contentPadding: const EdgeInsets.fromLTRB(12.0, 18.0, 12.0, 14.0),
              errorMaxLines: 1,
              labelStyle: DSTypography.regular16.copyWith(
                color: DSColors.darkGrey,
              ),
              hintStyle: DSTypography.regular16.copyWith(
                color: DSColors.darkGrey,
                height: 1.5,
              ),
              floatingLabelStyle: DSTypography.regular13.copyWith(
                color: DSColors.darkGrey,
              ),
              counterStyle: DSTypography.regular14.copyWith(
                color: DSColors.gray,
              ),
              errorStyle: DSTypography.regular12.copyWith(
                color: DSColors.pink,
                height: 0.2,
              ),
              fillColor: DSColors.white,
              filled: true,
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                borderSide: BorderSide(color: DSColors.lightGrey),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                borderSide: BorderSide(width: 2.0, color: DSColors.silverGrey),
              ),
              errorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                borderSide: BorderSide(color: DSColors.pink),
              ),
              focusedErrorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                borderSide: BorderSide(width: 2.0, color: DSColors.pink),
              ),
              disabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                borderSide: BorderSide(color: DSColors.lightGrey),
              ),
            ),
            textTheme: TextTheme(
              displayLarge: baseTextTheme.displayLarge?.copyWith(
                color: DSColors.smoothBlack,
              ),
              displayMedium: baseTextTheme.displayMedium?.copyWith(
                color: DSColors.smoothBlack,
              ),
              displaySmall: baseTextTheme.displaySmall?.copyWith(
                color: DSColors.gray,
              ),
              headlineLarge: baseTextTheme.headlineLarge?.copyWith(
                color: DSColors.smoothWhite,
              ),
              bodyLarge: baseTextTheme.bodyLarge?.copyWith(
                color: DSColors.spaceBlack,
              ),
              bodyMedium: baseTextTheme.bodyMedium?.copyWith(
                color: DSColors.gray,
              ),
              bodySmall: baseTextTheme.bodySmall?.copyWith(
                color: DSColors.smoothBlack,
              ),
              titleMedium: baseTextTheme.titleMedium?.copyWith(
                color: DSColors.smoothBlack,
              ),
            ),
          ),
        );

  /// Creates a [DSTheme] configured with a dark [ThemeData].
  DSTheme.dark()
      : this._(
          data: baseTheme.copyWith(
            brightness: Brightness.dark,
            scaffoldBackgroundColor: DSColors.smoothBlack,
            canvasColor: DSColors.spaceBlack,
            dividerColor: DSColors.spaceBlack,
            disabledColor: DSColors.mirageBlack,
            progressIndicatorTheme: const ProgressIndicatorThemeData(
              color: DSColors.blue,
            ),
            textSelectionTheme: const TextSelectionThemeData(
              cursorColor: DSColors.gray, //thereby
            ),
            dialogBackgroundColor: DSColors.smoothBlueBlack,
            colorScheme: baseTheme.colorScheme.copyWith(
              primary: DSColors.darkBlue,
              onPrimary: DSColors.smoothWhite,
              surface: DSColors.darkBlue,
              onSurface: DSColors.smoothWhite,
              secondary: DSColors.titaniumGray,
              secondaryContainer: DSColors.smoothBlueBlack,
              onSecondaryContainer: DSColors.gray,
              tertiaryContainer: DSColors.smoothBlueGray,
              onTertiaryContainer: DSColors.smoothWhite,
            ),
            appBarTheme: AppBarTheme(
              backgroundColor: DSColors.spaceBlack,
              surfaceTintColor: DSColors.transparent,
              titleTextStyle: DSTypography.regular20.copyWith(
                color: DSColors.lightGrey,
              ),
              foregroundColor:
                  MaterialStateColor.resolveWith((Set<MaterialState> states) {
                return states.contains(MaterialState.scrolledUnder)
                    ? DSColors.lightGrey
                    : DSColors.white;
              }),
              shadowColor: DSColors.appBarShadow,
              iconTheme: const IconThemeData(
                size: 28.0,
                color: DSColors.titaniumGray,
              ),
              actionsIconTheme: const IconThemeData(
                size: 28.0,
                color: DSColors.titaniumGray,
              ),
            ),
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              selectedIconTheme: IconThemeData(
                color: DSColors.lightGrey,
                size: 24.0,
              ),
              unselectedIconTheme: IconThemeData(
                color: DSColors.titaniumGray,
                size: 24.0,
              ),
            ),
            bottomSheetTheme: const BottomSheetThemeData(
              backgroundColor: DSColors.smoothBlueBlack,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: DSColors.blue,
                textStyle: DSTypography.regular15,
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 2.0,
                ),
                minimumSize: const Size(56.0, 24.0),
              ),
            ),
            outlinedButtonTheme: OutlinedButtonThemeData(
              style: OutlinedButton.styleFrom(
                backgroundColor: DSColors.smoothBlueBlack,
                shape: const RoundedRectangleBorder(
                  borderRadius: buttonBorderRadius,
                ),
                side: BorderSide(color: DSColors.gray),
                foregroundColor: DSColors.blue,
                textStyle: DSTypography.regular20.copyWith(
                  height: 1.2,
                ),
                minimumSize: const Size(128.0, 64.0),
                shadowColor: Colors.transparent,
              ),
            ),
            inputDecorationTheme: InputDecorationTheme(
              contentPadding: const EdgeInsets.fromLTRB(12.0, 18.0, 12.0, 14.0),
              errorMaxLines: 1,
              labelStyle: DSTypography.regular16.copyWith(
                color: DSColors.darkGrey,
              ),
              hintStyle: DSTypography.regular16.copyWith(
                color: DSColors.darkGrey,
                height: 1.5,
              ),
              floatingLabelStyle: DSTypography.regular13.copyWith(
                color: DSColors.darkGrey,
              ),
              counterStyle: DSTypography.regular14.copyWith(
                color: DSColors.gray,
              ),
              errorStyle: DSTypography.regular12.copyWith(
                color: DSColors.pink,
                height: 0.2,
              ),
              fillColor: DSColors.mirageBlack,
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                borderSide: BorderSide(color: DSColors.spaceBlack),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                borderSide: BorderSide(width: 2.0, color: DSColors.silverGrey),
              ),
              errorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                borderSide: BorderSide(color: DSColors.pink),
              ),
              focusedErrorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                borderSide: BorderSide(width: 2.0, color: DSColors.pink),
              ),
              disabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                borderSide: BorderSide(color: DSColors.spaceBlack),
              ),
            ),
            textTheme: TextTheme(
              displayLarge: baseTextTheme.displayLarge?.copyWith(
                color: DSColors.smoothWhite,
              ),
              displayMedium: baseTextTheme.displayMedium?.copyWith(
                color: DSColors.smoothWhite,
              ),
              displaySmall: baseTextTheme.displaySmall?.copyWith(
                color: DSColors.titaniumGray,
              ),
              headlineLarge: baseTextTheme.headlineLarge?.copyWith(
                color: DSColors.smoothWhite,
              ),
              bodyLarge: baseTextTheme.bodyLarge?.copyWith(
                color: DSColors.smoothWhite,
              ),
              bodyMedium: baseTextTheme.bodyMedium?.copyWith(
                color: DSColors.smoothWhite,
              ),
              bodySmall: baseTextTheme.bodySmall?.copyWith(
                color: DSColors.smoothWhite,
              ),
              titleMedium: baseTextTheme.titleMedium?.copyWith(
                color: DSColors.smoothWhite,
              ),
            ),
          ),
        );

  final ThemeData data;

  @visibleForTesting
  static const baseTextTheme = TextTheme(
    displayLarge: DSTypography.secondaryRegular38,
    displayMedium: DSTypography.secondaryRegular24,
    displaySmall: DSTypography.secondaryRegular18,
    headlineLarge: DSTypography.regular32,
    bodyLarge: DSTypography.regular20,
    bodyMedium: DSTypography.regular16,
    bodySmall: DSTypography.regular15,
    titleMedium: DSTypography.regular16,
  );

  @visibleForTesting
  static final ThemeData baseTheme = ThemeData(
    useMaterial3: true,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    fontFamily: DSTypography.primaryFontFamily,
    textTheme: baseTextTheme,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: buttonBorderRadius,
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
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: DSColors.blue,
      contentTextStyle: DSTypography.regular20.copyWith(
        color: DSColors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
  );

  static const buttonBorderRadius = BorderRadius.all(
    Radius.circular(16.0),
  );
  static const bottomSheetBorderRadius = BorderRadius.all(
    Radius.circular(16.0),
  );

  static const defaultPageMargin = EdgeInsets.symmetric(horizontal: 24.0);

  static const iconSplashRadius = 24.0;

  static const inputFieldHeight = 80.0;

  static const defaultAppBarHeight = 72.0;

  static const defaultAppBarBorderRadius = BorderRadius.vertical(
    bottom: Radius.circular(24.0),
  );
}
