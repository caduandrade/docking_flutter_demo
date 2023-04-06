import 'dart:math';

import 'package:demoflu/demoflu.dart';
import 'package:docking/docking.dart';
import 'package:docking_demo/examples/child_builder_mixin.dart';
import 'package:flutter/material.dart';

class ChangingItemExample extends Example {
  ChangingItemExample()
      : super(
            widget: MainWidget(),
            codeFile: 'lib/examples/item/changing_item.dart');
}

class MainWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MainWidgetState();
}

class MainWidgetState extends State<MainWidget> with ChildBuilderMixin {
  late DockingLayout _layout;

  @override
  void initState() {
    super.initState();
    _layout = DockingLayout(
        root: DockingRow([
      DockingItem(name: '1', widget: buildChild(1)),
      DockingItem(id: 'id', name: '2', widget: _dockingItemWidget())
    ]));
  }

  @override
  Widget build(BuildContext context) {
    return Docking(layout: _layout);
  }

  Widget _dockingItemWidget() {
    return Container(
        child: Center(
            child: ElevatedButton(
                child: Text('Change name'), onPressed: _changeName)));
  }

  void _changeName() {
    DockingItem? item = _layout.findDockingItem('id');
    if (item != null) {
      Random random = Random();
      item.name = random.nextInt(9999).toString();
      _layout.rebuild();
    }
  }
}
