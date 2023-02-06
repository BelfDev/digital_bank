import 'package:flutter/widgets.dart';

import 'ds_colors.dart';

/// A collection of static [TextStyle]s describing the application typography.
class DSTypography {
  DSTypography._();

  static const primaryFontFamily = 'gowun_dodum';
  static const secondaryFontFamily = 'gowun_batang';

  // =======
  // Regular
  // =======

  static const regular32 = TextStyle(
    fontFamily: primaryFontFamily,
    color: DSColors.grey,
    fontSize: 32,
    height: 1.0,
  );

  static const regular26 = TextStyle(
    fontFamily: primaryFontFamily,
    color: DSColors.grey,
    fontWeight: FontWeight.w400,
    fontSize: 26,
    height: 1.0,
  );

  static const regular22 = TextStyle(
    fontFamily: primaryFontFamily,
    color: DSColors.grey,
    fontWeight: FontWeight.w400,
    fontSize: 22,
    height: 1.0,
  );

  static const regular20 = TextStyle(
    fontFamily: primaryFontFamily,
    fontWeight: FontWeight.w400,
    color: DSColors.grey,
    fontSize: 20,
  );

  static const regular18 = TextStyle(
    fontFamily: primaryFontFamily,
    fontWeight: FontWeight.w400,
    color: DSColors.grey,
    fontSize: 18,
  );

  static const regular16 = TextStyle(
    fontFamily: primaryFontFamily,
    fontWeight: FontWeight.w400,
    color: DSColors.grey,
    fontSize: 16,
  );

  static const regular15 = TextStyle(
    fontFamily: primaryFontFamily,
    fontWeight: FontWeight.w400,
    color: DSColors.grey,
    fontSize: 15,
  );

  static const regular14 = TextStyle(
    fontFamily: primaryFontFamily,
    fontWeight: FontWeight.w400,
    color: DSColors.grey,
    fontSize: 14,
  );

  static const regular13 = TextStyle(
    fontFamily: primaryFontFamily,
    fontWeight: FontWeight.w400,
    color: DSColors.grey,
    fontSize: 13,
  );

  static const regular12 = TextStyle(
    fontFamily: primaryFontFamily,
    fontWeight: FontWeight.w400,
    color: DSColors.grey,
    fontSize: 12,
  );

  // ====
  // Bold
  // ====

  static const bold13 = TextStyle(
    fontFamily: primaryFontFamily,
    color: DSColors.grey,
    fontWeight: FontWeight.w700,
    fontSize: 13,
  );

  // =========
  // Semi Bold
  // =========

  static const semiBold22 = TextStyle(
    fontFamily: primaryFontFamily,
    color: DSColors.spaceBlack,
    fontWeight: FontWeight.w600,
    fontSize: 22,
  );

  static const semiBold20 = TextStyle(
    fontFamily: primaryFontFamily,
    color: DSColors.spaceBlack,
    fontWeight: FontWeight.w600,
    fontSize: 20,
  );

  static const semiBold18 = TextStyle(
    fontFamily: primaryFontFamily,
    color: DSColors.spaceBlack,
    fontWeight: FontWeight.w600,
    fontSize: 18,
  );

  static const semiBold16 = TextStyle(
    fontFamily: primaryFontFamily,
    color: DSColors.spaceBlack,
    fontWeight: FontWeight.w600,
    fontSize: 16,
  );

// ======
// Medium
// ======

  static const medium16 = TextStyle(
    fontFamily: primaryFontFamily,
    color: DSColors.spaceBlack,
    fontWeight: FontWeight.w500,
    fontSize: 16,
  );

  static const medium15 = TextStyle(
    fontFamily: primaryFontFamily,
    color: DSColors.spaceBlack,
    fontWeight: FontWeight.w500,
    fontSize: 15,
  );

  static const medium14 = TextStyle(
    fontFamily: primaryFontFamily,
    color: DSColors.spaceBlack,
    fontWeight: FontWeight.w500,
    fontSize: 14,
  );

  static const medium13 = TextStyle(
    fontFamily: primaryFontFamily,
    color: DSColors.spaceBlack,
    fontWeight: FontWeight.w500,
    fontSize: 13,
  );
}