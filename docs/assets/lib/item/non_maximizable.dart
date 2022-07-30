import 'package:demoflu/demoflu.dart';
import 'package:docking/docking.dart';
import 'package:docking_demo/child_builder_mixin.dart';
import 'package:flutter/widgets.dart';

class NonMaximizableExample extends Example with ChildBuilderMixin {
  @override
  Widget buildMainWidget(BuildContext context) {
    Widget child1 = buildChild(1);
    Widget child2 = buildChild(2);
    DockingLayout layout = DockingLayout(
        root: DockingRow([
      DockingItem(name: '1', widget: child1),
      DockingItem(name: '2', widget: child2, maximizable: false)
    ]));
    Docking docking = Docking(layout: layout);
    return docking;
  }
}
