import 'package:demoflu/demoflu.dart';
import 'package:docking/docking.dart';
import 'package:flutter/material.dart';

class StringifyCustomId extends Example {
  StringifyCustomId()
      : super(
            widget: MainWidget(),
            codeFile: 'lib/examples/layout/stringify_custom_id.dart');
}

class MainWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MainWidgetState();
}

enum ExampleId { blue, green }

class MainWidgetState extends State<MainWidget>
    with AreaBuilderMixin
    implements LayoutParser {
  late DockingLayout _layout;
  String _lastStringify = '';

  @override
  void initState() {
    super.initState();
    _layout = DockingLayout(
        root: DockingRow([
      DockingItem(id: ExampleId.green, widget: greenWidget),
      DockingItem(id: ExampleId.blue, widget: blueWidget)
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
    if (id == ExampleId.green) {
      return DockingItem(
          id: id, weight: weight, maximized: maximized, widget: greenWidget);
    } else if (id == ExampleId.blue) {
      return DockingItem(
          id: id, weight: weight, maximized: maximized, widget: blueWidget);
    }
    throw StateError('ID not recognized: $id');
  }

  @override
  String idToString(dynamic id) {
    if (id == null) {
      // row, column and tabs
      return '';
    }
    // item
    ExampleId exampleId = id;
    // Just a simple example but don't do this as it depends on not changing
    // the order of values in the enum.
    return exampleId.index.toString();
  }

  @override
  dynamic stringToId(String id) {
    if (id.isEmpty) {
      return null;
    }
    int index = int.parse(id);
    return ExampleId.values[index];
  }
}
