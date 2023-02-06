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
          data: _baseTheme.copyWith(
            brightness: Brightness.light,
            scaffoldBackgroundColor: DSColors.smoothWhite,
            canvasColor: DSColors.smoothWhite,
            dividerColor: DSColors.paleGrey,
            disabledColor: DSColors.paleGrey,
            progressIndicatorTheme: const ProgressIndicatorThemeData(
              color: DSColors.turquoise,
            ),
            textSelectionTheme: const TextSelectionThemeData(
              cursorColor: DSColors.turquoise, //thereby
            ),
            colorScheme: _baseTheme.colorScheme.copyWith(
              secondary: DSColors.turquoise,
            ),
            appBarTheme: AppBarTheme(
              backgroundColor: DSColors.white,
              titleTextStyle: DSTypography.semiBold18.copyWith(
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
                color: DSColors.titaniumGrey,
              ),
            ),
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              selectedIconTheme: IconThemeData(
                color: DSColors.spaceBlack,
                size: 24.0,
              ),
              unselectedIconTheme: IconThemeData(
                color: DSColors.titaniumGrey,
                size: 24.0,
              ),
            ),
            bottomSheetTheme: const BottomSheetThemeData(
              backgroundColor: DSColors.smoothWhite,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: DSColors.persianGreen,
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 2.0,
                ),
                textStyle: DSTypography.regular14.copyWith(
                  color: DSColors.grey,
                ),
                minimumSize: const Size(56.0, 24.0),
              ),
            ),
            inputDecorationTheme: InputDecorationTheme(
              contentPadding: const EdgeInsets.fromLTRB(12, 18, 12, 14),
              errorMaxLines: 1,
              labelStyle: DSTypography.regular16.copyWith(
                color: DSColors.darkGrey,
              ),
              hintStyle: DSTypography.regular16.copyWith(
                color: DSColors.darkGrey,
              ),
              floatingLabelStyle: DSTypography.regular13.copyWith(
                color: DSColors.darkGrey,
              ),
              counterStyle: DSTypography.regular14.copyWith(
                color: DSColors.grey,
              ),
              fillColor: DSColors.paleGrey,
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
              displayLarge: _baseTextTheme.displayLarge?.copyWith(
                color: DSColors.smoothBlack,
              ),
            ),
          ),
        );

  /// Creates a [DSTheme] configured with a dark [ThemeData].
  DSTheme.dark()
      : this._(
          data: _baseTheme.copyWith(
            brightness: Brightness.dark,
            scaffoldBackgroundColor: DSColors.smoothBlack,
            canvasColor: DSColors.spaceBlack,
            dividerColor: DSColors.spaceBlack,
            disabledColor: DSColors.mirageBlack,
            progressIndicatorTheme: const ProgressIndicatorThemeData(
              color: DSColors.turquoise,
            ),
            textSelectionTheme: const TextSelectionThemeData(
              cursorColor: DSColors.turquoise, //thereby
            ),
            colorScheme: _baseTheme.colorScheme.copyWith(
              secondary: DSColors.turquoise,
            ),
            appBarTheme: AppBarTheme(
              backgroundColor: DSColors.spaceBlack,
              titleTextStyle: DSTypography.semiBold18.copyWith(
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
                color: DSColors.lightGrey,
              ),
              actionsIconTheme: const IconThemeData(
                size: 28.0,
                color: DSColors.titaniumGrey,
              ),
            ),
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              selectedIconTheme: IconThemeData(
                color: DSColors.lightGrey,
                size: 24.0,
              ),
              unselectedIconTheme: IconThemeData(
                color: DSColors.titaniumGrey,
                size: 24.0,
              ),
            ),
            bottomSheetTheme: const BottomSheetThemeData(
              backgroundColor: DSColors.smoothBlueBlack,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: DSColors.turquoise,
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 2.0,
                ),
                textStyle: DSTypography.regular14.copyWith(
                  color: DSColors.grey,
                ),
                minimumSize: const Size(56.0, 24.0),
              ),
            ),
            inputDecorationTheme: InputDecorationTheme(
              contentPadding: const EdgeInsets.fromLTRB(12, 18, 12, 14),
              errorMaxLines: 1,
              labelStyle: DSTypography.regular16.copyWith(
                color: DSColors.darkGrey,
              ),
              hintStyle: DSTypography.regular16.copyWith(
                color: DSColors.darkGrey,
              ),
              floatingLabelStyle: DSTypography.regular13.copyWith(
                color: DSColors.darkGrey,
              ),
              counterStyle: DSTypography.regular14.copyWith(
                color: DSColors.grey,
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
              displayLarge: _baseTextTheme.displayLarge?.copyWith(
                color: DSColors.smoothWhite,
              ),
            ),
          ),
        );

  final ThemeData data;

  static const _baseTextTheme = TextTheme(
    displayLarge: DSTypography.secondaryRegular42,
  );

  static final ThemeData _baseTheme = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    fontFamily: DSTypography.primaryFontFamily,
    textTheme: _baseTextTheme,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: elevatedButtonBorderRadius,
        ),
        textStyle: DSTypography.regular20.copyWith(
          color: DSColors.smoothWhite,
        ),
        minimumSize: const Size(128.0, 64.0),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
    ),
  );

  static const elevatedButtonBorderRadius = BorderRadius.all(
    Radius.circular(16.0),
  );
}
