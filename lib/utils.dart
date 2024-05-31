import 'package:flutter/widgets.dart';

import 'priority_widget.dart';

class Utils {
  static List<Widget> widgetsInUse(
      List<PriorityWidget> widgets, double availableWidth, bool isRow) {
    final priorities = widgets.map((e) => e.priority).toSet().toList()
      ..sort((a, b) => a.compareTo(b));

    final widgetsInUse = <int, Widget>{};

    double usedWidth = 0;

    for (int priority in priorities) {
      final widgetsWithPriority = widgets.where((e) => e.priority == priority);

      for (PriorityWidget candidate in widgetsWithPriority) {
        if (availableWidth - usedWidth >= candidate.sizeInMainAxis) {
          final originalIndex = widgets.indexOf(candidate);

          widgetsInUse[originalIndex] = SizedBox(
            width: isRow ? candidate.sizeInMainAxis : null,
            height: isRow ? null : candidate.sizeInMainAxis,
            child: candidate.child,
          );

          usedWidth += candidate.sizeInMainAxis;
        }
      }
    }
    return mapToListSortedByKey(widgetsInUse);
  }

  static List<T> mapToListSortedByKey<T>(Map<int, T> map) {
    // Get the keys of the map and sort them
    List<int> sortedKeys = map.keys.toList()..sort();

    // Create a list with values sorted by the sorted keys
    List<T> sortedList = sortedKeys.map((key) => map[key]!).toList();

    return sortedList;
  }
}
