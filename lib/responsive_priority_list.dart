import 'package:flutter/material.dart';

import 'priority_widget.dart';
import 'utils.dart';

/// A [Row] or [Column] that hides that shows or hides it's children based on given priority.
///
/// If two or more widgets have the same priority set, they will be prioritized by order in the list.
/// If a widget is too big for the left over space, the next widget in the priority list that
/// fits in the space will be chosen.
/// Will be empty if smallest element is larger than available size.
class ResponsivePriorityList extends StatelessWidget {
  const ResponsivePriorityList.column({
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.textDirection,
    this.verticalDirection = VerticalDirection.down,
    this.textBaseline,
    this.availableWidth,
    required this.children,
  }) : isRow = false;

  const ResponsivePriorityList.row({
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.textDirection,
    this.verticalDirection = VerticalDirection.down,
    this.textBaseline,
    this.availableWidth,
    required this.children,
  }) : isRow = true;

  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final CrossAxisAlignment crossAxisAlignment;
  final TextDirection? textDirection;
  final VerticalDirection verticalDirection;
  final TextBaseline? textBaseline;

  // With that the Row
  final double? availableWidth;
  final List<PriorityWidget> children;

  final bool isRow;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final availableWidth = constraints.maxWidth;

      final widgets = Utils.widgetsInUse(children, availableWidth, isRow);

      return isRow
          ? Row(
              mainAxisAlignment: mainAxisAlignment,
              mainAxisSize: mainAxisSize,
              crossAxisAlignment: crossAxisAlignment,
              textDirection: textDirection,
              verticalDirection: verticalDirection,
              textBaseline: textBaseline,
              children: widgets,
            )
          : Column(
              mainAxisAlignment: mainAxisAlignment,
              mainAxisSize: mainAxisSize,
              crossAxisAlignment: crossAxisAlignment,
              textDirection: textDirection,
              verticalDirection: verticalDirection,
              textBaseline: textBaseline,
              children: widgets,
            );
    });
  }
}
