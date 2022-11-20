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
import 'package:docking_demo/theme/hide_tabs_area_theme.dart';
import 'package:docking_demo/theme/tabs_theme.dart';
import 'package:flutter/material.dart';

import 'item/non_maximizable.dart';

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
    title: 'Docking (1.5.0)',
    widgetBackground: Colors.white,
    maxSize: maxSize,
    resizable: true,
    initialHeightWeight: .95,
    initialWidthWeight: .95,
    appMenuBuilder: () {
      return [
        DemoMenuItem(name: 'Layouts', italic: true),
        DemoMenuItem(
            name: 'Row',
            builder: () => LayoutR(),
            codeFile: 'lib/layout/layout_r.dart',
            indentation: 2),
        DemoMenuItem(
            name: 'Column',
            builder: () => LayoutC(),
            codeFile: 'lib/layout/layout_c.dart',
            indentation: 2),
        DemoMenuItem(
            name: 'Tabs',
            builder: () => LayoutT(),
            codeFile: 'lib/layout/layout_t.dart',
            indentation: 2),
        DemoMenuItem(
            name: 'Row > Column',
            builder: () => LayoutRC(),
            codeFile: 'lib/layout/layout_rc.dart',
            indentation: 2),
        DemoMenuItem(
            name: 'Row > Column > Tabs',
            builder: () => LayoutRCT(),
            codeFile: 'lib/layout/layout_rct.dart',
            indentation: 2),
        DemoMenuItem(
            name: 'Row > Column > Row',
            builder: () => LayoutRCR(),
            codeFile: 'lib/layout/layout_rcr.dart',
            indentation: 2),
        DemoMenuItem(name: 'Item', italic: true),
        DemoMenuItem(
            name: 'Non-closable',
            builder: () => NonClosableExample(),
            codeFile: 'lib/item/non_closable.dart',
            indentation: 2),
        DemoMenuItem(
            name: 'Non-maximizable',
            builder: () => NonMaximizableExample(),
            codeFile: 'lib/item/non_maximizable.dart',
            indentation: 2),
        DemoMenuItem(
            name: 'Selection listener',
            builder: () => SelectionListenerExample(),
            consoleEnabled: true,
            codeFile: 'lib/item/selection_listener.dart',
            indentation: 2),
        DemoMenuItem(
            name: 'Close listener',
            builder: () => CloseListenerExample(),
            codeFile: 'lib/item/close_listener.dart',
            indentation: 2),
        DemoMenuItem(
            name: 'Close interceptor',
            builder: () => CloseInterceptorExample(),
            codeFile: 'lib/item/close_interceptor.dart',
            indentation: 2),
        DemoMenuItem(
            name: 'Buttons',
            builder: () => ItemButtonsExample(),
            codeFile: 'lib/item/item_buttons.dart',
            indentation: 2),
        DemoMenuItem(name: 'Theme', italic: true),
        DemoMenuItem(
            name: 'Tabs',
            builder: () => TabsThemeExample(),
            codeFile: 'lib/theme/tabs_theme.dart',
            indentation: 2),
        DemoMenuItem(
            name: 'Divider',
            builder: () => DividerThemeExample(),
            codeFile: 'lib/theme/divider_theme.dart',
            indentation: 2),
        DemoMenuItem(
            name: 'Tabs area visible',
            builder: () => HideTabsAreaThemeExample(),
            codeFile: 'lib/theme/hide_tabs_area_theme.dart',
            indentation: 2),
        DemoMenuItem(
            name: 'Keep alive',
            builder: () => KeepAliveExample(),
            codeFile: 'lib/keep_alive.dart'),
        DemoMenuItem(
            name: 'Docking buttons',
            builder: () => ButtonsBuilderExample(),
            codeFile: 'lib/buttons_builder.dart')
      ];
    },
  ));
}
