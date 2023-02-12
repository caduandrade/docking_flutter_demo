import 'package:demoflu/demoflu.dart';
import 'package:docking/docking.dart';
import 'package:docking_demo/examples/child_builder_mixin.dart';
import 'package:flutter/material.dart';

class CloseInterceptorExample extends Example {
  CloseInterceptorExample()
      : super(
            widget: MainWidget(),
            codeFile: 'lib/examples/item/close_interceptor.dart');
}

class MainWidget extends StatelessWidget with ChildBuilderMixin {
  @override
  Widget build(BuildContext context) {
    Widget child1 = buildChild(1);
    Widget child2 = buildChild(2);
    DockingLayout layout = DockingLayout(
        root: DockingRow([
      DockingItem(name: '1', widget: child1),
      DockingItem(name: '2', widget: child2)
    ]));
    Docking docking = Docking(
        layout: layout,
        itemCloseInterceptor: (DockingItem item) {
          return _checkItem(context, item);
        });
    return docking;
  }

  bool _checkItem(BuildContext context, DockingItem item) {
    if (item.name == '1') {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: const Text('item 1 can not be closed'),
          duration: const Duration(seconds: 3)));
      return false;
    }
    return true;
  }
}
