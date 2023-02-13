import 'package:ds_components/ds_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract class DSAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DSAppBar({
    super.key,
    required this.title,
    this.preferredSize = const PreferredAppBarSize(DSTheme.defaultAppBarHeight),
    this.transparent = false,
    this.titleWidget,
    this.bottom,
    this.systemUiOverlayStyle,
    this.leading,
    this.shape,
    this.backgroundColor,
    this.leadingWidth,
  });

  const factory DSAppBar.title(
    String title, {
    Widget? leading,
    Key? key,
  }) = _TitleAppBar;

  const factory DSAppBar.transparent({
    String? title,
    Widget? titleWidget,
    SystemUiOverlayStyle? systemUiOverlayStyle,
    Widget? leading,
    double? leadingWidth,
    Key? key,
  }) = _TransparentAppBar;

  final String? title;
  @override
  final Size preferredSize;
  final PreferredSizeWidget? bottom;
  final bool transparent;
  final Widget? titleWidget;
  final SystemUiOverlayStyle? systemUiOverlayStyle;
  final Widget? leading;
  final ShapeBorder? shape;
  final Color? backgroundColor;
  final double? leadingWidth;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final defaultSystemUiOverlayStyle = theme.brightness == Brightness.light
        ? SystemUiOverlayStyle.dark
        : SystemUiOverlayStyle.light;

    return AppBar(
      elevation: transparent ? 0.0 : 16.0,
      toolbarHeight: preferredSize.height,
      leading: leading,
      shape: shape,
      backgroundColor: backgroundColor,
      leadingWidth: leadingWidth,
      centerTitle: true,
      titleSpacing: 0.0,
      title: title != null
          ? Text(title!,
              style: theme.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ))
          : null,
      systemOverlayStyle: systemUiOverlayStyle ?? defaultSystemUiOverlayStyle,
    );
  }
}

class PreferredAppBarSize extends Size {
  const PreferredAppBarSize(
    this.toolbarHeight, {
    this.bottomHeight,
  }) : super.fromHeight(
          (toolbarHeight ?? kToolbarHeight) + (bottomHeight ?? 0.0),
        );

  final double? toolbarHeight;
  final double? bottomHeight;
}

class _TitleAppBar extends DSAppBar {
  const _TitleAppBar(
    String title, {
    super.key,
    Widget? leading,
  }) : super(
          preferredSize: const PreferredAppBarSize(DSTheme.defaultAppBarHeight),
          title: title,
          leading: leading,
          shape: const RoundedRectangleBorder(
            borderRadius: DSTheme.defaultAppBarBorderRadius,
          ),
        );
}

class _TransparentAppBar extends DSAppBar {
  const _TransparentAppBar({
    String? title,
    Widget? titleWidget,
    bool? transparent,
    SystemUiOverlayStyle? systemUiOverlayStyle,
    Widget? leading,
    double? leadingWidth,
    Key? key,
  }) : super(
          preferredSize:
              const PreferredAppBarSize(DSTheme.defaultAppBarHeight - 16.0),
          transparent: transparent ?? true,
          title: title ?? '',
          leading: leading,
          titleWidget: titleWidget,
          systemUiOverlayStyle: systemUiOverlayStyle,
          leadingWidth: leadingWidth,
          backgroundColor: DSColors.transparent,
          key: key,
        );
}
