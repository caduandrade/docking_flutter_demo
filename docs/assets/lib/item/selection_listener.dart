import 'package:demoflu/demoflu.dart';
import 'package:docking/docking.dart';
import 'package:docking_demo/child_builder_mixin.dart';
import 'package:flutter/widgets.dart';

class SelectionListenerExample extends StatelessWidget with ChildBuilderMixin {
  @override
  Widget build(BuildContext context) {
    Widget child1 = buildChild(1);
    Widget child2 = buildChild(2);
    Widget child3 = buildChild(3);
    DockingLayout layout = DockingLayout(
        root: DockingTabs([
      DockingItem(name: '1', widget: child1),
      DockingItem(name: '2', widget: child2),
      DockingItem(name: '3', widget: child3)
    ]));
    Docking docking = Docking(
        layout: layout,
        onItemSelection: (DockingItem item) {
          DemoFlu.printOnConsole(context, item.name!);
          print(item.name!);
        });
    return docking;
  }
}
