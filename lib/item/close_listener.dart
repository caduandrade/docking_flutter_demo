import 'package:demoflu/demoflu.dart';
import 'package:docking/docking.dart';
import 'package:docking_demo/child_builder_mixin.dart';
import 'package:flutter/material.dart';

class CloseListenerExample extends Example with ChildBuilderMixin {
  @override
  Widget buildMainWidget(BuildContext context) {
    Widget child1 = buildChild(1);
    Widget child2 = buildChild(2);
    Widget child3 = buildChild(3);
    DockingLayout layout = DockingLayout(
        root: DockingRow([
      DockingItem(name: '1', widget: child1),
      DockingItem(name: '2', widget: child2),
      DockingItem(name: '3', widget: child3)
    ]));
    Docking docking = Docking(
        layout: layout,
        onItemClose: (DockingItem item) {
          _onItemClose(context, item);
        });
    return docking;
  }

  void _onItemClose(BuildContext context, DockingItem item) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('item ' + item.name! + ' has been closed'),
        duration: const Duration(seconds: 3)));
  }
}
