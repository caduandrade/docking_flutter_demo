import 'package:demoflu/demoflu.dart';
import 'package:flutter/material.dart';

import 'layout_c.dart';
import 'layout_r.dart';
import 'layout_rc.dart';
import 'layout_rcr.dart';
import 'layout_rct.dart';
import 'layout_t.dart';

void main() {
  bool screenshots = false;

  Size? maxSize;
  if (screenshots) {
    maxSize = Size(500, 400);
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
        ])
      ];
    },
  ));
}
