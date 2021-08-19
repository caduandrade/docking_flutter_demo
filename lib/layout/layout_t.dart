import 'package:docking/docking.dart';
import 'package:docking_demo/child_builder_mixin.dart';
import 'package:flutter/widgets.dart';

class LayoutT extends StatelessWidget with ChildBuilderMixin {
  @override
  Widget build(BuildContext context) {
    int v = 1;
    Widget child1 = buildChild(v++);
    Widget child2 = buildChild(v++);
    DockingLayout layout = DockingLayout(
        root: DockingTabs([
      DockingItem(name: '1', widget: child1),
      DockingItem(name: '2', widget: child2)
    ]));
    Docking docking = Docking(layout: layout);
    return docking;
  }
}
