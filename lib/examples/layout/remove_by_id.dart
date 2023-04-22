import 'package:demoflu/demoflu.dart';
import 'package:docking/docking.dart';
import 'package:docking_demo/examples/child_builder_mixin.dart';
import 'package:flutter/material.dart';

class RemoveById extends Example {
  RemoveById()
      : super(
            widget: MainWidget(),
            codeFile: 'lib/examples/layout/remove_by_id.dart');
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
    _rebuildLayout();
  }

  void _rebuildLayout() {
    int v = 1;
    Widget child1 = buildChild(v++);
    Widget child2 = buildChild(v++);
    Widget child3 = buildChild(v++);
    Widget child4 = buildChild(v++);
    _layout = DockingLayout(
        root: DockingRow([
      DockingItem(id: 1, name: '1', widget: child1),
      DockingColumn([
        DockingItem(id: 2, name: '2', widget: child2),
        DockingTabs([
          DockingItem(id: 3, name: '3', widget: child3),
          DockingItem(id: 4, name: '4', widget: child4)
        ])
      ])
    ]));
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Row(children: [
        ElevatedButton(onPressed: _remove, child: Text('Remove 2 and 4')),
        SizedBox(width: 8),
        ElevatedButton(onPressed: _reset, child: Text('Reset'))
      ]),
      SizedBox(height: 8),
      Expanded(child: Docking(layout: _layout))
    ]);
  }

  void _remove() {
    _layout.removeItemByIds([2, 4]);
  }

  void _reset() {
    setState(() {
      _rebuildLayout();
    });
  }
}
