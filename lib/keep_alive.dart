import 'package:docking/docking.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tabbed_view/tabbed_view.dart';

class KeepAliveExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget textA = Center(child: Text('A'));
    Widget textB = Center(child: Text('B'));
    Widget textField = Padding(
        child: Center(
            child: TextField(
                decoration: InputDecoration(
                    isDense: true, border: OutlineInputBorder()))),
        padding: EdgeInsets.all(16));
    Widget myStatefulWidget = MyStatefulWidget();

    DockingLayout layout = DockingLayout(
        root: DockingRow([
      DockingColumn([
        DockingItem(name: 'A', widget: textA),
        DockingItem(
            name: 'myStatefulWidget', widget: myStatefulWidget, keepAlive: true)
      ]),
      DockingTabs([
        DockingItem(name: 'B', widget: textB),
        DockingItem(name: 'textField', widget: textField, keepAlive: true)
      ])
    ]));
    Docking docking = Docking(layout: layout);
    TabbedViewTheme theme =
        TabbedViewTheme(child: docking, data: TabbedViewThemeData.mobile());
    return theme;
  }
}

class MyStatefulWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyStatefulWidgetState();
}

class MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _value = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: TextButton(
            child: Text('$_value'),
            onPressed: () {
              setState(() {
                _value++;
              });
            }));
  }
}
