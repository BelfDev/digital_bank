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
    this.leadingWidget,
    this.shape,
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
    Key? key,
  }) = _TransparentAppBar;

  final String? title;
  @override
  final Size preferredSize;
  final PreferredSizeWidget? bottom;
  final bool transparent;
  final Widget? titleWidget;
  final SystemUiOverlayStyle? systemUiOverlayStyle;
  final Widget? leadingWidget;
  final ShapeBorder? shape;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final defaultSystemUiOverlayStyle = theme.brightness == Brightness.light
        ? SystemUiOverlayStyle.dark
        : SystemUiOverlayStyle.light;

    return AppBar(
      elevation: transparent ? 0.0 : 16.0,
      toolbarHeight: preferredSize.height,
      leading: leadingWidget,
      shape: shape,
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
          leadingWidget: leading,
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
    Key? key,
  }) : super(
          preferredSize: const PreferredAppBarSize(DSTheme.defaultAppBarHeight),
          transparent: transparent ?? true,
          title: title ?? '',
          leadingWidget: const DSCloseButton(),
          titleWidget: titleWidget,
          systemUiOverlayStyle: systemUiOverlayStyle,
          key: key,
        );
}
