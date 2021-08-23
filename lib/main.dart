import 'package:demoflu/demoflu.dart';
import 'package:docking_demo/buttons_builder.dart';
import 'package:docking_demo/item/close_interceptor.dart';
import 'package:docking_demo/item/close_listener.dart';
import 'package:docking_demo/item/item_buttons.dart';
import 'package:docking_demo/item/non_closable.dart';
import 'package:docking_demo/item/selection_listener.dart';
import 'package:docking_demo/keep_alive.dart';
import 'package:docking_demo/layout/layout_c.dart';
import 'package:docking_demo/layout/layout_r.dart';
import 'package:docking_demo/layout/layout_rc.dart';
import 'package:docking_demo/layout/layout_rcr.dart';
import 'package:docking_demo/layout/layout_rct.dart';
import 'package:docking_demo/layout/layout_t.dart';
import 'package:docking_demo/theme/divider_theme.dart';
import 'package:docking_demo/theme/tabs_theme.dart';
import 'package:flutter/material.dart';

enum ScreenshotSize { off, big, small }

void main() {
  ScreenshotSize screenshotSize = ScreenshotSize.off;

  Size? maxSize;
  if (screenshotSize == ScreenshotSize.big) {
    maxSize = Size(500, 400);
  } else if (screenshotSize == ScreenshotSize.small) {
    maxSize = Size(500, 200);
  }
  runApp(DemoFluApp(
    title: 'Docking (0.6.0)',
    widgetBackground: Colors.white,
    maxSize: maxSize,
    resizable: true,
    initialHeightWeight: .95,
    initialWidthWeight: .95,
    appMenuBuilder: (exampleMenuNotifier) {
      return [
        MenuItem(name: 'Layouts', italic: true),
        MenuItem(
            name: 'Row',
            example: LayoutR(),
            codeFile: 'lib/layout/layout_r.dart',
            indentation: 2),
        MenuItem(
            name: 'Column',
            example: LayoutC(),
            codeFile: 'lib/layout/layout_c.dart',
            indentation: 2),
        MenuItem(
            name: 'Tabs',
            example: LayoutT(),
            codeFile: 'lib/layout/layout_t.dart',
            indentation: 2),
        MenuItem(
            name: 'Row > Column',
            example: LayoutRC(),
            codeFile: 'lib/layout/layout_rc.dart',
            indentation: 2),
        MenuItem(
            name: 'Row > Column > Tabs',
            example: LayoutRCT(),
            codeFile: 'lib/layout/layout_rct.dart',
            indentation: 2),
        MenuItem(
            name: 'Row > Column > Row',
            example: LayoutRCR(),
            codeFile: 'lib/layout/layout_rcr.dart',
            indentation: 2),
        MenuItem(name: 'Item', italic: true),
        MenuItem(
            name: 'Non-closable',
            example: NonClosableExample(),
            codeFile: 'lib/item/non_closable.dart',
            indentation: 2),
        MenuItem(
            name: 'Selection listener',
            example: SelectionListenerExample(),
            consoleEnabled: true,
            codeFile: 'lib/item/selection_listener.dart',
            indentation: 2),
        MenuItem(
            name: 'Close listener',
            example: CloseListenerExample(),
            codeFile: 'lib/item/close_listener.dart',
            indentation: 2),
        MenuItem(
            name: 'Close interceptor',
            example: CloseInterceptorExample(),
            codeFile: 'lib/item/close_interceptor.dart',
            indentation: 2),
        MenuItem(
            name: 'Buttons',
            example: ItemButtonsExample(),
            codeFile: 'lib/item/item_buttons.dart',
            indentation: 2),
        MenuItem(name: 'Theme', italic: true),
        MenuItem(
            name: 'Tabs',
            example: TabsThemeExample(),
            codeFile: 'lib/theme/tabs_theme.dart',
            indentation: 2),
        MenuItem(
            name: 'Divider',
            example: DividerThemeExample(),
            codeFile: 'lib/theme/divider_theme.dart',
            indentation: 2),
        MenuItem(
            name: 'Keep alive',
            example: KeepAliveExample(),
            codeFile: 'lib/keep_alive.dart'),
        MenuItem(
            name: 'Docking buttons',
            example: ButtonsBuilderExample(),
            codeFile: 'lib/buttons_builder.dart')
      ];
    },
  ));
}
