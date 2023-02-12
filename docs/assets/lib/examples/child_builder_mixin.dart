import 'package:flutter/widgets.dart';

mixin ChildBuilderMixin {
  Widget buildChild(int value) {
    return Container(child: Center(child: Text('Child $value')));
  }
}
