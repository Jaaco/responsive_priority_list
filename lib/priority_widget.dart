import 'package:flutter/widgets.dart';

class PriorityWidget {
  final int priority;
  final double sizeInMainAxis;
  final Widget child;

  const PriorityWidget({
    required this.priority,
    required this.sizeInMainAxis,
    required this.child,
  });
}
