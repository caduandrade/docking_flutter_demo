import 'package:demoflu/demoflu.dart';
import 'package:docking_demo/item/non_closable.dart';
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
    title: 'Docking (0.4.0)',
    widgetBackground: Colors.white,
    maxSize: maxSize,
    resizable: true,
    initialHeightWeight: .95,
    initialWidthWeight: .95,
    sectionsBuilder: (menuNotifier) {
      return [
        Section(name: 'Layouts', examples: [
          Example(name: 'Row', content: LayoutR()),
          Example(name: 'Column', content: LayoutC()),
          Example(name: 'Tabs', content: LayoutT()),
          Example(name: 'Row > Column', content: LayoutRC()),
          Example(name: 'Row > Column > Tabs', content: LayoutRCT()),
          Example(name: 'Row > Column > Row', content: LayoutRCR())
        ]),
        Section(name: 'Item', examples: [
          Example(name: 'Non-closable', content: NonClosableExample())
        ])
      ];
    },
  ));
}
