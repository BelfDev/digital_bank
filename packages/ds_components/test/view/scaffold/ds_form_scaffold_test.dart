import 'package:ds_components/ds_components.dart';
import 'package:ds_components/src/resources/ds_transparent_image.dart';
import 'package:ds_components/src/view/image/ds_artwork_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/ds_widget_tester_extension.dart';

void main() {
  group('DSFormScaffold:', () {
    testWidgets('Renders core widgets and properties', (
      WidgetTester tester,
    ) async {
      final expectedAppBar = AppBar(title: Text('App Bar Test'));
      const expectedBody = Center(child: Text('Body Test'));
      final expectedImage = MemoryImage(dsTransparentImage);
      const expectedFloatingButton = FloatingActionButton(onPressed: null);
      const expectedPadding = EdgeInsets.symmetric(horizontal: 16.0);
      final expectedFormKey = GlobalKey<FormState>();

      await tester.pumpMaterialWidget(
        DSFormScaffold(
          appBar: expectedAppBar,
          imageProvider: expectedImage,
          floatingButton: expectedFloatingButton,
          padding: expectedPadding,
          formKey: expectedFormKey,
          bodyChildren: [
            expectedBody,
            expectedBody,
            expectedBody,
          ],
        ),
      );

      expect(find.byWidget(expectedAppBar), findsOneWidget);
      expect(find.byWidget(expectedBody), findsNWidgets(3));
      expect(find.byWidget(expectedFloatingButton), findsOneWidget);
      expect(find.byWidgetPredicate((widget) {
        if (widget is Padding) {
          return widget.padding == expectedPadding;
        }
        return false;
      }), findsNWidgets(2));
      expect(find.byWidgetPredicate((widget) {
        if (widget is DSArtworkImage) {
          return widget.imageProvider == expectedImage;
        }
        return false;
      }), findsNothing);
      expect(find.byWidgetPredicate((widget) {
        if (widget is Form) {
          return widget.key == expectedFormKey;
        }
        return false;
      }), findsOneWidget);

      expect(find.byType(Scaffold), findsOneWidget);
      expect(find.byWidgetPredicate((widget) {
        if (widget is Scaffold) {
          return widget.floatingActionButtonLocation ==
              FloatingActionButtonLocation.centerFloat;
        }
        return false;
      }), findsOneWidget);
      expect(find.byType(SingleChildScrollView), findsOneWidget);
      expect(find.byType(SafeArea), findsOneWidget);
      expect(find.byWidgetPredicate((widget) {
        if (widget is Column) {
          return widget.crossAxisAlignment == CrossAxisAlignment.stretch &&
              widget.mainAxisAlignment == MainAxisAlignment.start;
        }
        return false;
      }), findsOneWidget);
      expect(find.byType(SizedBox), findsNWidgets(2));
    });

    testWidgets('Renders with optional arguments', (
      WidgetTester tester,
    ) async {
      final expectedAppBar = AppBar(title: Text('App Bar Test'));
      const expectedBody = Center(child: Text('Body Test'));
      final expectedImage = MemoryImage(dsTransparentImage);
      const expectedFloatingButton = FloatingActionButton(onPressed: null);
      const expectedPadding = EdgeInsets.symmetric(horizontal: 16.0);
      final expectedFormKey = GlobalKey<FormState>();

      await tester.pumpMaterialWidget(
        DSFormScaffold(
          formKey: expectedFormKey,
          bodyChildren: [
            expectedBody,
            expectedBody,
            expectedBody,
          ],
        ),
      );

      expect(find.byWidget(expectedAppBar), findsNothing);
      expect(find.byWidget(expectedBody), findsNWidgets(3));
      expect(find.byWidget(expectedFloatingButton), findsNothing);
      expect(find.byWidgetPredicate((widget) {
        if (widget is Padding) {
          return widget.padding == expectedPadding;
        }
        return false;
      }), findsNothing);
      expect(find.byWidgetPredicate((widget) {
        if (widget is DSArtworkImage) {
          return widget.imageProvider == expectedImage;
        }
        return false;
      }), findsNothing);
      expect(find.byWidgetPredicate((widget) {
        if (widget is DSArtworkImage) {
          return widget.imageProvider == expectedImage;
        }
        return false;
      }), findsNothing);
      expect(find.byWidgetPredicate((widget) {
        if (widget is Form) {
          return widget.key == expectedFormKey;
        }
        return false;
      }), findsOneWidget);

      expect(find.byType(Scaffold), findsOneWidget);
      expect(find.byWidgetPredicate((widget) {
        if (widget is Scaffold) {
          return widget.floatingActionButtonLocation ==
              FloatingActionButtonLocation.centerFloat;
        }
        return false;
      }), findsOneWidget);
      expect(find.byType(SingleChildScrollView), findsOneWidget);
      expect(find.byType(SafeArea), findsNothing);
      expect(find.byWidgetPredicate((widget) {
        if (widget is Column) {
          return widget.crossAxisAlignment == CrossAxisAlignment.stretch &&
              widget.mainAxisAlignment == MainAxisAlignment.start;
        }
        return false;
      }), findsOneWidget);
      expect(find.byType(SizedBox), findsNothing);
    });
  });
}
