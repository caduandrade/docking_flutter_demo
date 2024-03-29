import 'package:demoflu/demoflu.dart';
import 'package:docking/docking.dart';
import 'package:docking_demo/examples/child_builder_mixin.dart';
import 'package:flutter/material.dart';

class ItemButtonsExample extends Example {
  ItemButtonsExample()
      : super(
            widget: MainWidget(),
            codeFile: 'lib/examples/item/item_buttons.dart');
}

class MainWidget extends StatelessWidget with ChildBuilderMixin {
  @override
  Widget build(BuildContext context) {
    Widget child1 = buildChild(1);
    Widget child2 = buildChild(2);
    Widget child3 = buildChild(3);
    DockingLayout layout = DockingLayout(
        root: DockingRow([
      DockingItem(name: '1', widget: child1),
      DockingColumn([
        DockingItem(name: '2', widget: child2),
        DockingItem(name: '3', widget: child3, buttons: [
          TabButton(
              icon: IconProvider.data(Icons.add_circle_outline),
              onPressed: () => _toast(context, 'add button')),
          TabButton(
              icon: IconProvider.data(Icons.arrow_drop_down_outlined),
              menuBuilder: (context) {
                return [
                  TabbedViewMenuItem(
                      text: 'Option 1',
                      onSelection: () => _toast(context, '1')),
                  TabbedViewMenuItem(
                      text: 'Option 2', onSelection: () => _toast(context, '2'))
                ];
              })
        ])
      ])
    ]));
    Docking docking = Docking(layout: layout);
    return docking;
  }

  void _toast(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(msg), duration: const Duration(seconds: 1)));
  }
}
