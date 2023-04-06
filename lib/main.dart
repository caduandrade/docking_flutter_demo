import 'package:demoflu/demoflu.dart';
import 'package:docking_demo/examples/buttons_builder.dart';
import 'package:docking_demo/examples/item/changing_item.dart';
import 'package:docking_demo/examples/item/close_interceptor.dart';
import 'package:docking_demo/examples/item/close_listener.dart';
import 'package:docking_demo/examples/item/item_buttons.dart';
import 'package:docking_demo/examples/item/item_leading.dart';
import 'package:docking_demo/examples/item/non_closable.dart';
import 'package:docking_demo/examples/item/non_maximizable.dart';
import 'package:docking_demo/examples/item/selection_listener.dart';
import 'package:docking_demo/examples/keep_alive.dart';
import 'package:docking_demo/examples/layout/layout_c.dart';
import 'package:docking_demo/examples/layout/layout_r.dart';
import 'package:docking_demo/examples/layout/layout_rc.dart';
import 'package:docking_demo/examples/layout/layout_rcr.dart';
import 'package:docking_demo/examples/layout/layout_rct.dart';
import 'package:docking_demo/examples/layout/layout_t.dart';
import 'package:docking_demo/examples/size/initial_size.dart';
import 'package:docking_demo/examples/size/initial_weight.dart';
import 'package:docking_demo/examples/size/minimal_size.dart';
import 'package:docking_demo/examples/theme/divider_theme.dart';
import 'package:docking_demo/examples/theme/hide_tabs_area_theme.dart';
import 'package:docking_demo/examples/theme/tabs_theme.dart';
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
      title: 'Docking (1.10.0)',
      widthWeight: .95,
      heightWeight: .95,
      exampleBackground: Colors.white,
      maxSize: maxSize,
      rootMenus: _rootMenus));
}

List<DemoMenuItem> get _rootMenus =>
    [_layouts, _dockingItem, _size, _theme, _keepAlive, _dockingButtons];

DemoMenuItem get _layouts => DemoMenuItem('Layouts', children: [
      _layoutR,
      _layoutC,
      _layoutT,
      _layoutRC,
      _layoutRCT,
      _layoutRCR
    ]);

DemoMenuItem get _layoutR => DemoMenuItem('Row', example: LayoutR());

DemoMenuItem get _layoutC => DemoMenuItem('Column', example: LayoutC());

DemoMenuItem get _layoutT => DemoMenuItem('Tabs', example: LayoutT());

DemoMenuItem get _layoutRC => DemoMenuItem('Row > Column', example: LayoutRC());

DemoMenuItem get _layoutRCT =>
    DemoMenuItem('Row > Column > Tabs', example: LayoutRCT());

DemoMenuItem get _layoutRCR =>
    DemoMenuItem('Row > Column > Row', example: LayoutRCR());

DemoMenuItem get _dockingItem => DemoMenuItem('DockingItem', children: [
      _nonClosable,
      _nonMaximizable,
      _selectionListener,
      _closeListener,
      _closeInterceptor,
      _buttons,
      _leadingWidget,
      _changingItem
    ]);

DemoMenuItem get _nonClosable =>
    DemoMenuItem('Non-closable', example: NonClosableExample());

DemoMenuItem get _nonMaximizable =>
    DemoMenuItem('Non-maximizable', example: NonMaximizableExample());

DemoMenuItem get _selectionListener =>
    DemoMenuItem('Selection listener', example: SelectionListenerExample());

DemoMenuItem get _closeListener =>
    DemoMenuItem('Close listener', example: CloseListenerExample());

DemoMenuItem get _closeInterceptor =>
    DemoMenuItem('Close interceptor', example: CloseInterceptorExample());

DemoMenuItem get _buttons =>
    DemoMenuItem('Buttons', example: ItemButtonsExample());

DemoMenuItem get _leadingWidget =>
    DemoMenuItem('Leading widget', example: ItemLeading());

DemoMenuItem get _changingItem =>
    DemoMenuItem('Changing item', example: ChangingItemExample());

DemoMenuItem get _size => DemoMenuItem('Size',
    children: [_minimalSize, _initialSize, _initialWeight]);

DemoMenuItem get _minimalSize =>
    DemoMenuItem('Minimal size', example: MinimalSize());

DemoMenuItem get _initialSize =>
    DemoMenuItem('Initial size', example: InitialSize());

DemoMenuItem get _initialWeight =>
    DemoMenuItem('Initial weight', example: InitialWeight());

DemoMenuItem get _theme =>
    DemoMenuItem('Theme', children: [_tabs, _divider, _tabsAreaVisible]);

DemoMenuItem get _tabs => DemoMenuItem('Tabs', example: TabsThemeExample());

DemoMenuItem get _divider =>
    DemoMenuItem('Divider', example: DividerThemeExample());

DemoMenuItem get _tabsAreaVisible =>
    DemoMenuItem('Tabs area visible', example: HideTabsAreaThemeExample());

DemoMenuItem get _keepAlive =>
    DemoMenuItem('Keep alive', example: KeepAliveExample());

DemoMenuItem get _dockingButtons =>
    DemoMenuItem('Docking buttons', example: ButtonsBuilderExample());
