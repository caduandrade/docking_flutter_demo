import 'package:demoflu/demoflu.dart';
import 'package:docking_demo/item/close_interceptor.dart';
import 'package:docking_demo/item/close_listener.dart';
import 'package:docking_demo/item/item_buttons.dart';
import 'package:docking_demo/item/non_closable.dart';
import 'package:docking_demo/item/selection_listener.dart';
import 'package:docking_demo/theme/theme.dart';
import 'package:flutter/material.dart';

import 'layout/layout_c.dart';
import 'layout/layout_r.dart';
import 'layout/layout_rc.dart';
import 'layout/layout_rcr.dart';
import 'layout/layout_rct.dart';
import 'layout/layout_t.dart';

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
    title: 'Docking (0.5.0)',
    widgetBackground: Colors.white,
    maxSize: maxSize,
    resizable: true,
    initialHeightWeight: .95,
    initialWidthWeight: .95,
    sectionsBuilder: (menuNotifier) {
      return [
        Section(name: 'Layouts', examples: [
          Example(
              name: 'Row',
              content: LayoutR(),
              codeFile: 'lib/layout/layout_r.dart'),
          Example(
              name: 'Column',
              content: LayoutC(),
              codeFile: 'lib/layout/layout_c.dart'),
          Example(
              name: 'Tabs',
              content: LayoutT(),
              codeFile: 'lib/layout/layout_t.dart'),
          Example(
              name: 'Row > Column',
              content: LayoutRC(),
              codeFile: 'lib/layout/layout_rc.dart'),
          Example(
              name: 'Row > Column > Tabs',
              content: LayoutRCT(),
              codeFile: 'lib/layout/layout_rct.dart'),
          Example(
              name: 'Row > Column > Row',
              content: LayoutRCR(),
              codeFile: 'lib/layout/layout_rcr.dart')
        ]),
        Section(name: 'Item', examples: [
          Example(
              name: 'Non-closable',
              content: NonClosableExample(),
              codeFile: 'lib/item/non_closable.dart'),
          Example(
              name: 'Selection listener',
              content: SelectionListenerExample(),
              consoleEnabled: true,
              codeFile: 'lib/item/selection_listener.dart'),
          Example(
              name: 'Close listener',
              content: CloseListenerExample(),
              codeFile: 'lib/item/close_listener.dart'),
          Example(
              name: 'Close interceptor',
              content: CloseInterceptorExample(),
              codeFile: 'lib/item/close_interceptor.dart'),
          Example(
              name: 'Buttons',
              content: ItemButtonsExample(),
              codeFile: 'lib/item/item_buttons.dart')
        ]),
        Section(examples: [
          Example(
              name: 'Theme',
              content: ThemeExample(),
              codeFile: 'lib/theme/theme.dart')
        ])
      ];
    },
  ));
}
