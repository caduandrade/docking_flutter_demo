import 'package:demoflu/demoflu.dart';
import 'package:docking/docking.dart';
import 'package:docking_demo/examples/child_builder_mixin.dart';
import 'package:flutter/widgets.dart';

class NonClosableExample extends Example {
  NonClosableExample()
      : super(
            widget: MainWidget(),
            codeFile: 'lib/examples/item/non_closable.dart');
}

class MainWidget extends StatelessWidget with ChildBuilderMixin {
  @override
  Widget build(BuildContext context) {
    Widget child1 = buildChild(1);
    Widget child2 = buildChild(2);
    DockingLayout layout = DockingLayout(
        root: DockingRow([
      DockingItem(name: '1', widget: child1),
      DockingItem(name: '2', widget: child2, closable: false)
    ]));
    Docking docking = Docking(layout: layout);
    return docking;
  }
}
