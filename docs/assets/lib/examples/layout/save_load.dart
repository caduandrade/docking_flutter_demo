import 'package:demoflu/demoflu.dart';
import 'package:docking/docking.dart';
import 'package:flutter/material.dart';

class SaveRestore extends Example {
  SaveRestore()
      : super(
            widget: MainWidget(),
            codeFile: 'lib/examples/layout/save_load.dart');
}

class MainWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MainWidgetState();
}

class MainWidgetState extends State<MainWidget>
    with LayoutParserMixin, AreaBuilderMixin {
  late DockingLayout _layout;
  String _lastStringify = '';

  @override
  void initState() {
    super.initState();
    _layout = DockingLayout(
        root: DockingRow([
      DockingItem(id: 'green', widget: greenWidget),
      DockingItem(id: 'blue', widget: blueWidget)
    ]));
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Row(children: [
        ElevatedButton(onPressed: _saveLayout, child: Text('Save layout')),
        SizedBox(width: 8),
        ElevatedButton(
            onPressed: _lastStringify.isNotEmpty ? _loadLayout : null,
            child: Text('Load layout'))
      ]),
      SizedBox(height: 8),
      Text('Last stringify: $_lastStringify'),
      SizedBox(height: 8),
      Expanded(child: Docking(layout: _layout))
    ]);
  }

  void _saveLayout() {
    setState(() {
      _lastStringify = _layout.stringify(parser: this);
    });
  }

  void _loadLayout() {
    if (_lastStringify.isNotEmpty) {
      _layout.load(layout: _lastStringify, parser: this, builder: this);
    }
  }

  Widget get greenWidget =>
      Center(child: Text('Green', style: TextStyle(color: Colors.green)));

  Widget get blueWidget =>
      Center(child: Text('Blue', style: TextStyle(color: Colors.blue)));

  @override
  DockingItem buildDockingItem(
      {required dynamic id, required double? weight, required bool maximized}) {
    if (id == 'green') {
      return DockingItem(
          id: id, weight: weight, maximized: maximized, widget: greenWidget);
    } else if (id == 'blue') {
      return DockingItem(
          id: id, weight: weight, maximized: maximized, widget: blueWidget);
    }
    throw StateError('ID not recognized: $id');
  }
}
