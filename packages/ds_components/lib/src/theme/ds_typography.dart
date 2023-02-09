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

  static const secondaryRegular38 = TextStyle(
    fontFamily: secondaryFontFamily,
    fontWeight: FontWeight.w400,
    color: DSColors.smoothBlack,
    fontSize: 38,
    height: 1.6,
  );

  static const secondaryRegular24 = TextStyle(
    fontFamily: secondaryFontFamily,
    fontWeight: FontWeight.w400,
    color: DSColors.smoothBlack,
    fontSize: 24,
    height: 1.4,
  );

  static const secondaryRegular18 = TextStyle(
    fontFamily: secondaryFontFamily,
    fontWeight: FontWeight.w400,
    color: DSColors.smoothBlack,
    fontSize: 18,
    height: 1.2,
  );

  static const regular32 = TextStyle(
    fontFamily: primaryFontFamily,
    color: DSColors.smoothBlack,
    fontWeight: FontWeight.w400,
    fontSize: 32,
    height: 1.3,
    letterSpacing: 8.0,
  );

  static const regular20 = TextStyle(
    fontFamily: primaryFontFamily,
    color: DSColors.smoothBlack,
    fontWeight: FontWeight.w400,
    fontSize: 20,
    height: 1.0,
  );

  static const regular16 = TextStyle(
    fontFamily: primaryFontFamily,
    color: DSColors.smoothBlack,
    fontWeight: FontWeight.w400,
    fontSize: 16,
    height: 1.2,
  );

  static const regular15 = TextStyle(
    fontFamily: primaryFontFamily,
    color: DSColors.smoothBlack,
    fontWeight: FontWeight.w400,
    fontSize: 15,
    height: 1.2,
  );

  static const regular12 = TextStyle(
    fontFamily: primaryFontFamily,
    color: DSColors.smoothBlack,
    fontWeight: FontWeight.w400,
    fontSize: 12,
    height: 0.7,
  );

  // TODO(BelfDev): Clean up unused styles
  // OLD

  static const regular26 = TextStyle(
    fontFamily: primaryFontFamily,
    color: DSColors.gray,
    fontWeight: FontWeight.w400,
    fontSize: 26,
    height: 1.0,
  );

  static const regular22 = TextStyle(
    fontFamily: primaryFontFamily,
    color: DSColors.gray,
    fontWeight: FontWeight.w400,
    fontSize: 22,
    height: 1.0,
  );

  static const regular18 = TextStyle(
    fontFamily: primaryFontFamily,
    fontWeight: FontWeight.w400,
    color: DSColors.gray,
    fontSize: 18,
  );

  static const regular14 = TextStyle(
    fontFamily: primaryFontFamily,
    fontWeight: FontWeight.w400,
    color: DSColors.gray,
    fontSize: 14,
  );

  static const regular13 = TextStyle(
    fontFamily: primaryFontFamily,
    fontWeight: FontWeight.w400,
    color: DSColors.gray,
    fontSize: 13,
  );

  // ====
  // Bold
  // ====

  static const bold13 = TextStyle(
    fontFamily: primaryFontFamily,
    color: DSColors.gray,
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
