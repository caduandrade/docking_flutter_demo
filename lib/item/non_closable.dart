import 'package:docking/docking.dart';
import 'package:flutter/widgets.dart';

import '../child_builder_mixin.dart';

class NonClosableExample extends StatelessWidget with ChildBuilderMixin {
  @override
  Widget build(BuildContext context) {
    DockingLayout layout = DockingLayout(
        root: DockingRow([
      DockingItem(name: '1', widget: buildChild(1)),
      DockingItem(name: '2', widget: buildChild(2), closable: false)
    ]));
    Docking docking = Docking(layout: layout);
    return docking;
  }
}
